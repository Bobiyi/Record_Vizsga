<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;

use App\Http\Requests\CheckPasswordRequest;

use App\Http\Requests\StoreRecordRequest;
use App\Http\Resources\ArtistResource;
use App\Http\Resources\RecordResource;

use App\Http\Resources\UserResource;

use App\Models\Artist;
use App\Models\Record;
use App\Models\User;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class RecordController extends Controller
{

    /**
     * Checks if the recieved name and password matches a database record with the same name and hashed password.
     * @param CheckPasswordRequest $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function checkPass(CheckPasswordRequest $request) {
        $data = $request->all();

        $user = User::where('name', $data['name'])->first();

        if(!$user) {
            return response()->json(['message'=>'User not found!'], 403);
        }

        if(Hash::check($data['password'],$user->password_hash)) {
            return response()->json(['message'=>'Password correct!', 'user' => UserResource::make($user)], 202);
        } else {
            return response()->json(['message'=>'Password incorrect!'], 403);
        }
    }

    /**
     * Returns all Records. 
     *  Optional: 
     *      query - ?type=[TypeName] -> Returns all records which has the given queries type
     * @return \Illuminate\Http\JsonResponse
     */
    public function getRecords(Request $request){

        $list = Record::with('artists')
            ->when($request->query('type'), function($query) use ($request) {
                $query->whereHas('type', function($q) use ($request) {
                    $q->where('type_name', $request->query('type'));
                });
            })
            ->get();

        $listRes = RecordResource::collection($list);
        return response()->json($listRes);
    }

    /**
     * Returns the Record on a given id.
     * @param int $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function getRecord(int $id) {
        $record = Record::with('artists')->findOrFail($id);

        $recordRes = RecordResource::make($record);

        return response()->json($recordRes);
    }

    /**
     * Return all Records.
     * @return \Illuminate\Http\JsonResponse
     */
    public function getArtists() {
        $list = Artist::all();

        $listRes = ArtistResource::collection($list);

        return response()->json($listRes);
    }

    /**
     * Return the Artist on a given Id.
     * @param int $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function getArtist(int $id) {
        $artist = Artist::findOrFail($id);

        $artistRes = ArtistResource::make($artist);

        return response()->json($artistRes);
    }


    /**
     * Return a given Records All Artists
     * @param int $recordId
     * @return \Illuminate\Http\JsonResponse
     */
    public function getRecordsArtists(int $recordId) {
        $record = Record::with('artists')->findOrFail($recordId);

        return response()->json(ArtistResource::collection($record->artists));
    }

    /**
     * Return a given Artists All Records
     * @param int $artistId
     * @return \Illuminate\Http\JsonResponse
     */
    public function getArtistsRecords(int $artistId) {
        $artist = Artist::with('records')->findOrFail($artistId);

        return response()->json(RecordResource::collection($artist->records));
    }

    public function addRecord(StoreRecordRequest $request) {
        $data = $request->toModel();

        $path = null;
        
        if($request->hasFile('recordFile')) {

            $file = $request->file('recordFile');

            $fileName = pathinfo($file->getClientOriginalName(),PATHINFO_FILENAME);

            $extension = $file->getClientOriginalExtension();

            $savedFileName = $fileName.'_'.uniqid().'.'.$extension;

            $path = $file->storeAs('Records',$savedFileName,'public');
        }

        $record=Record::create([
            'name' => $data['name'],
            'type_id' => $data['type_id'],
            'release_year' => $data['release_year'],
            'length' => $data['length'],
            'file_path' => $path
        ]);

        return response()->json(['id'=>$record->id]);


    }

}

<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Http\Resources\UserResource;

use App\Models\Artist;
use App\Http\Resources\ArtistResource;

use App\Models\Record;
use App\Http\Resources\RecordResource;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

use App\Http\Requests\CheckPasswordRequest;

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
     * @return \Illuminate\Http\JsonResponse
     */
    public function getRecords(){
        $list = Record::with('artists')->get();
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


}

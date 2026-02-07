<?php

namespace App\Http\Controllers;

use App\Models\Artist;
use App\Http\Resources\ArtistResource;

use App\Models\Record;
use App\Http\Resources\RecordResource;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

class RecordController extends Controller
{

    /**
     * Returns all Records.
     * @return \Illuminate\Http\JsonResponse
     */
    public function getRecords(){
        $list = Record::all();
        $listRes = RecordResource::collection($list);

        return response()->json($listRes);
    }

    /**
     * Returns the Record on a given id.
     * @param int $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function getRecord(int $id) {
        $record = Record::findOrFail($id);

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
}

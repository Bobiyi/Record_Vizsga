<?php

namespace App\Http\Controllers;

use App\Models\Record;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Http\Resources\RecordResource;
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
     * Returns the record on a given id.
     * @param int $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function getRecord(int $id) {
        $record = Record::findOrFail($id);

        $recordRes = RecordResource::make($record);

        return response()->json($recordRes);
    }
}

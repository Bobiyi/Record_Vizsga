<?php

use App\Http\Controllers\RecordController;
use Illuminate\Support\Facades\Route;

Route::get('/records',[RecordController::class,'getRecords']);
Route::get('/records/{id}',[RecordController::class,'getRecord']);
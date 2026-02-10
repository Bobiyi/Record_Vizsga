<?php

use App\Http\Controllers\RecordController;
use Illuminate\Support\Facades\Route;

Route::post('/check-password',[RecordController::class,'checkPass']);

Route::get('/records',[RecordController::class,'getRecords']);
Route::get('/records/{id}',[RecordController::class,'getRecord']);

Route::get('/artists',[RecordController::class,'getArtists']);
Route::get('/artists/{id}',[RecordController::class,'getArtist']);

Route::get('/records-artist/{recordId}',[RecordController::class,'getRecordsArtists']);
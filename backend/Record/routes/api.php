<?php

use App\Http\Controllers\RecordController;
use Illuminate\Support\Facades\Route;

Route::post('/check-password',[RecordController::class,'checkPass']);

Route::get('/records',[RecordController::class,'getRecords']);
Route::redirect('/record','/api/records',301);
Route::get('/records/{id}',[RecordController::class,'getRecord']);

Route::get('/artists',[RecordController::class,'getArtists']);
Route::redirect('/artist','/api/artists',301);
Route::get('/artists/{id}',[RecordController::class,'getArtist']);

Route::get('/records-artist/{recordId}',[RecordController::class,'getRecordsArtists']);
Route::get('/artists-record/{artistId}',[RecordController::class,'getArtistsRecords']);

Route::post('/record',[RecordController::class,'addRecord']);

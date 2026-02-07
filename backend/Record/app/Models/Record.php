<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Record extends Model
{
    
    public $table = 'record';
    public $timestamps = false;
    
    protected $appends = ['image_url'];

    public function getImageUrlAttribute() {
        return asset('storage/'.$this->file_path);
    }
    protected $fillable = [
        'name','type_id','release_year','length','file_path'
    ];
}

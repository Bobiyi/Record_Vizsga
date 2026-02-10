<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use App\Models\RecordType;

class Record extends Model
{
    
    public $table = 'record';
    public $timestamps = false;
    
    protected $appends = ['image_url'];

    public function getImageUrlAttribute() {
        return asset('storage/'.$this->file_path);
    }
    
    public function artists(): BelongsToMany {
        return $this->belongsToMany(Artist::class,'artist_record')->withPivot('role');
    }

    public function getTypeNameAttribute() {
        return $this->type ? $this->type->type_name : null;
    }

    //TODO - MANY TO MANY REALTION WITH ARTIST

    protected $fillable = [
        'name','type_id','release_year','length','file_path'
    ];
}

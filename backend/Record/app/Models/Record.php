<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Facades\Storage;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Record extends Model
{
    
    public $table = 'record';
    public $timestamps = false;
    
    protected $appends = ['image_url'];

    public function getImageUrlAttribute() {
        return asset('storage/'.$this->file_path);
    }


    public function type(): BelongsTo {
        return $this->BelongsTo(RecordType::class,'type_id');
    }

    public function getTypeNameAttribute() {
        return $this->type ? $this->type->type_name : null;
    }

    //TODO - MANY TO MANY REALTION WITH ARTIST

    protected $fillable = [
        'name','type_id','release_year','length','file_path'
    ];
}

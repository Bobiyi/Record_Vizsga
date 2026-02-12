<?php

namespace App\Models;

use App\Models\Record;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class RecordType extends Model
{
    
    public $table='record_type';

    public $timestamps = false;

    public $incrementing = true;

    public function records(): HasMany {
        return $this-> hasMany(Record::class,'type_id');
    }
    protected $fillable = [
        'type_name'
    ];
}

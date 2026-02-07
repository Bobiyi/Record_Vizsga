<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class RecordType extends Model
{
    
    public $table='record_type';

    public $tmestapms = false;

    public function records(): HasMany {
        return $this-> hasMany(Record::class,'type_id');
    }
    protected $fillable = [
        'type_name'
    ];
}

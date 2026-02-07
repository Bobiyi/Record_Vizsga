<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Artist extends Model
{
    
    public $table = 'artist';

    public $timestamps = false;

    protected $casts = [
        'is_group' => 'boolean',
    ];
    protected $fillable=[
        'name','active_since','nationality','url','is_group'
    ];
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Artist extends Model
{
    
    public $table = 'artist';

    public $timestamps = false;

    public function records(): BelongsToMany {
        return $this->belongsToMany(Record::class, 'artist_record')->withPivot('role');
    }

    protected $casts = [
        'is_group' => 'boolean',
    ];
    protected $fillable=[
        'name','active_since','nationality','url','is_group'
    ];
}

<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Resources\Json\JsonResource;

class RecordResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $data=['id' => $this->id,
            'name' => $this->name,
            'typeName'=>$this->type?->type_name,
            'releaseYear' => $this->release_year,
            'length' => $this->length,
            'coverUrl' => $this->image_url];

    if($this->artists) {
        $data ['artistName']= $this->artists->pluck('name');
    }

        return $data;
    }
}

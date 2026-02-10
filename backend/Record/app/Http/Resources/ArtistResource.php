<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ArtistResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $data = [
            'id' => $this->id,
            'artistName' =>$this->name,
            'activeSince' =>$this->active_since,
            'nationality' =>$this->nationality,
            'website' => $this ->url,
            'isGroup' => $this->is_group,
        ];

        if ($this->pivot) {
            $data['role'] = $this->pivot->role;
        }

        return $data;
    }
}

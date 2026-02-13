<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class StoreArtistRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'artistName' => ['required','string','max:64',Rule::unique('artist','name')],
            'activeSince' => ['nullable','integer','digits:4'],
            'artistNationality' => ['nullable','string','max:3'],
            'artistWebsite' => ['nullable','string','max:128'],
            'isGroup' => ['required','integer','digits:1',Rule::in('0','1')],
            'artistIcon' => ['nullable','image','mimes:jpg'],
            'artistCover' => ['nullable','image','mimes:jpg']
        ];
    }

    public function toModel() {
        $data = $this->validated();

        $returnData=[
            'name' => $data['artistName'],
            'active_since' => $data['activeSince'],
            'nationality' => $data['artistNationality'],
            'url' => $data['artistWebsite'],
            'is_group' => $data['isGroup']
        ];

        return $returnData;
    }
}

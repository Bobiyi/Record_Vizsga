<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreRecordRequest extends FormRequest
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
            'recordName' =>['required','string','max:64'],
            'typeId' => ['required','integer'],
            'releaseYear' => ['nullable','integer','digits:4'],
            'length' => ['nullable','integer','min:1'],
            'recordFile' => ['nullable','image','mimes:jpg','dimensions:ratio=1/1,max_width=1280']
        ];
    }

    public function toModel() {
        $data = $this->validated();

        return[
            'name'=>$data['recordName'],
            'type_id'=>$data['typeId'],
            'release_year'=>$data['releaseYear'],
            'length'=>$data['length'],
            'file_path'=>$data['recordFile']
        ];
    }
}

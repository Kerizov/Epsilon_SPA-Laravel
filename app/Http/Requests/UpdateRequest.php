<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'login' => 'string|email',
            'firstname' => 'string',
            'lastname' => 'string',
            'phone_number' => 'string',
            'passport_series' => 'string',
            'passport_number' => 'string',
            'inn' => 'string',
            'mail_index' => 'string',
            'address' => 'string',
        ];
    }
}

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
            'email' => 'string|email',
            'firstname' => 'string|nullable',
            'lastname' => 'string|nullable',
            'phone_number' => 'string|nullable',
            'passport_series' => 'string|nullable',
            'passport_number' => 'string|nullable',
            'inn' => 'string|nullable',
            'mail_index' => 'string|nullable',
            'address' => 'string|nullable',
            'email_verified_at' => 'date_format:Y-m-d H:i:s'
        ];
    }
}

<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\UpdateRequest;
use Illuminate\Support\Facades\Auth;


class UpdateController extends Controller
{
    public function update(UpdateRequest $request){
        $user = Auth::user();
        $data = $request->validated();

        $user->firstname = $data['firstname'];
        $user->lastname = $data['lastname'];
        $user->email = $data['email'];
        $user->phone_number = $data['phone_number'];
        $user->passport_series = $data['passport_series'];
        $user->passport_number = $data['passport_number'];
        $user->inn = $data['inn'];
        $user->mail_index = $data['mail_index'];
        $user->address = $data['address'];

        $user->save();
    }
}

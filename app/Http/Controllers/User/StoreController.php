<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\UpdateRequest;
use App\Http\Requests\User\StoreRequest;
use App\Models\User;
use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Events\Verified;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class StoreController extends Controller
{
   public function store(StoreRequest $request)
   {
      $data = $request->validated();
      $user = User::where('email', $data['email'])->first();

      if($user) return response(['message' => 'Такая почта уже занята!']);

      $user = User::create($data);
      $token = auth()->tokenById($user->id);
       event(new Registered($user));

      return response(['access_token' => $token]);

//      User::create($data);
   }
    public function verification(){
//        $user = Auth::user();
//
////        $user->update(['email_verified_at' => now()]);
//        $user->email_verified_at = '2022-05-04 19:28:43';
//        $user->save();


//        $user->email_verified_at = $data['email_verified_at'];
//        $user->update(['email_verified_at' => now()]);
    }


}

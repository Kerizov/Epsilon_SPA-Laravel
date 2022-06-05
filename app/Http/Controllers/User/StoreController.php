<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\User\StoreRequest;
use App\Models\User;
use Illuminate\Auth\Events\Registered;

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

   }
}

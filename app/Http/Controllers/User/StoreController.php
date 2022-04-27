<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\User\StoreRequest;
use App\Models\User;
use Illuminate\Http\Request;

class StoreController extends Controller
{
   public function store(StoreRequest $request)
   {
      $data = $request->validated();
      $user = User::where('login', $data['login'])->first();

      if($user) return response(['message' => 'Такая почта уже занята!']);

      $user = User::create($data);
      $token = auth()->tokenById($user->id);
      return response(['access_token' => $token]);
//      User::create($data);
   }

}

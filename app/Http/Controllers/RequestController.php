<?php

namespace App\Http\Controllers;

use App\Http\Requests\SendMessageRequest;
use App\Models\Message;
use Illuminate\Http\Request;

class RequestController extends Controller
{
    public function store(SendMessageRequest $request){
        $data = $request->validated();
        $message = Message::create($data);
        return $message;
    }
}

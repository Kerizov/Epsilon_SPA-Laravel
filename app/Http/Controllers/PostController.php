<?php

namespace App\Http\Controllers;

use App\Http\Requests\PostRequest;
use App\Http\Requests\UpdateRequest;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;

class PostController extends Controller
{
    public function index(){
        $posts = Post::all();
        return $posts;
    }
    public function store(PostRequest $request){
        $post = $request->validated();
        Post::create([
            'title'=>$post['title'],
            'text'=>$post['text'],
        ]);
        return $post;
    }

}

<?php

namespace App\Http\Controllers;

use App\Http\Requests\PostRequest;
use App\Models\Post;
use Illuminate\Http\Request;

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

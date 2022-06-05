<?php

namespace App\Http\Controllers;

use App\Http\Requests\PostRequest;
use App\Models\Post;


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
            'full_text'=>$post['full_text'],
        ]);
        return $post;
    }

}

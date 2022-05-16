<?php

namespace App\Models;

use App\Models\Traits\Filterable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Air_route extends Model
{
    protected $guarded = [];
    use Filterable;
    use HasFactory;
}

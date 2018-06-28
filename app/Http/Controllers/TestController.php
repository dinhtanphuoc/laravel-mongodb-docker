<?php

namespace App\Http\Controllers;

use Jenssegers\Mongodb\Eloquent\Model as Eloquent;
use Illuminate\Http\Request;
use \App\User;

class TestController extends Controller
{
    public function index() {
        $data = User::all();

        return view('welcome', compact('data'));
    }

    public function add() {
        $data = new User;

        $data->username = 'Phuoc';
        $data->password = bcrypt('123456');
        $data->email = 'phuocdt@greenglobal.vn';
        $data->save();

        return 'Thanh Cong';
    }
}

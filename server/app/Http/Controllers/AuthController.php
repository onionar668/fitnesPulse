<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required|string|min:3',
            'email' => 'required|string|email',
            'password' => 'required|string',
            'phone' => 'required|string',
            'avatar_url' => 'sometimes|string'
        ]);

        $avatarPath = null;
        if($request->hasFile('avatar')){
            $avatarPath = $request->file('avatar')->store('avatars', 'public');
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => $request->password,
            'phone' => $request->phone,
            'avatar_url' => $avatarPath,
        ]);

        if(!$user){
            return response()->json([
                'error' => 'invalid credentials'
            ]);
        }

        $token = $user->createToken('auth')->plainTextToken;

        return response()->json([
            'message' => "Register user: $user[name] success",
            'token' => $token
        ]);
    }

    public function login(Request $request)
    {
        $request->validate([
            'login' => 'required|string',
            'password' => 'required|string',
        ]);

        $field = filter_var($request->login, FILTER_VALIDATE_EMAIL) ? 'email' : 'phone';
        $credentials = [
            $field => $request->login,
            'password' => $request->password
        ];

        if(!Auth::attempt($credentials)){
            return response()->json([
                'error' => 'Invalid credentials'
            ], 401);
        }

        $user = User::where($field, $request->login)->first();
        $token = $user->createToken('auth')->plainTextToken;

        return response()->json([
            'message' => 'Login successfully',
            'token' => $token
        ]);
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();
        return response()->json([
            'message' => 'User log out'
        ]);
    }

}

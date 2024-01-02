<?php

namespace App\Http\Controllers;

use App\Mail\WelcomeMail;
use Illuminate\Support\Facades\Mail;

class EmailController extends Controller
{
    public function sendWelcomeEmail()
    {
        $title = 'Welcome to the laravel dashboard example email';
        $body = 'Thank you for participating!';

        Mail::to('your-recipient@domain.com')->send(new WelcomeMail($title, $body));

        return "Email sent successfully!";
    }
}

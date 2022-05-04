<?php

namespace App\Providers;

use Illuminate\Auth\Notifications\VerifyEmail;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Support\Facades\Gate;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array<class-string, class-string>
     */
    protected $policies = [
        // 'App\Models\Model' => 'App\Policies\ModelPolicy',
    ];


    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        VerifyEmail::toMailUsing(function ($notifiable, $url) {
//            $token = request()->user()->BearerToken();
//            $token = auth()->tokenById(request()->user()->id);
//            $token = request()->header('Authorization');
            $myUrl =  'http://epsilon/cabinet';
            return (new MailMessage)
                ->subject('Подтвердить почту')
                ->line('Кликните на кнопку ниже для подтверждения почты')
                ->action('Подтвердить почту', $url);
        });
    }
}

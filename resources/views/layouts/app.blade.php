<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name', 'Epsilon') }}</title>
    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>
    <!-- Styles -->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
<div id="app">
    @yield('content')
</div>
</body>
</html>
<script>
    // import Epsilon from "../../js/components/Epsilon";
    //
    // export default {
    //     components: {Epsilon}
    // }
</script>

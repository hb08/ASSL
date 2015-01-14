<!DOCTYPE HTML>
<html lang="en">
<head>
    @include('includes.head')    
</head>
<body class="columns large-12">
    <div class="row">
        <header class="columns large-12">
            @include('includes.header')
        </header>
    </div>
    <div  class="row medium-12 large-12">
            @yield('content')
    </div><!-- End Row -->
    <div class="row">
        <!-- Navbar -->
        <nav class="top-bar" data-topbar role="navigation">
            @include('includes.navbar')    
        </nav>
    </div>
    @include('includes.footer')
</html>

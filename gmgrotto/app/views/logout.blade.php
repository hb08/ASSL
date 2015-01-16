<!DOCTYPE HTML>
<html lang="en">
<head>
	<title>GameMaster's Grotto</title>
	<meta charset="UTF-8">
	<!-- Foundation -->
	<meta charset="utf-8">
  	<!-- If you delete this meta tag World War Z will become a reality -->
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<link rel="stylesheet" href="{{asset('_css/foundation.min.css')}}">  
	<link rel="stylesheet" href="{{asset('_css/normalize.css')}}">  
     	<!-- Modernizr.JS Link -->
		<script src="{{asset('_js/vendor/modernizr.js')}}"></script>
	<!-- My Style Changes -->
    <link rel="stylesheet" href="{{asset('_css/styles.css')}}" >  
</head>
<body class="columns large-12">
	<div class="row">
		<header class="columns large-12">
			<h1 class="text-center">GameMaster's Grotto</h1>
		</header>
	</div>
	<div  class="row medium-12 large-12 fullHeight">
			<div class="columns medium-5 large-centered small-centered vert-center ">
				<!-- Logout Message -->
				<div class='row'>
					<h1>Logout</h1>
					<p>You have logged out of the Gamemaster's Grotto!</p>
					<p>Would you like to <a href="{{ URL::to('/login') }}">Log Back In</a>?</p>
				</div>
			</div>	<!-- End of Row	-->	
		</div>	<!-- End of Column -->
	</div><!-- End Row -->
	<div class="row">
		<!-- Navbar -->
		<nav class="top-bar" data-topbar role="navigation">
			<section class="top-bar-section">
				<ul class="left">
					<li><a href="#" id="d20" class="tog">D20</a></li>
					<li><a href="#" id="eg" class="tog">Enemy Generator</a></li>
				</ul>
				<ul class="right char">
					<li><a href="#" id="char1" class="tog">Char 1</a></li>
					<li><a href="#" id="char2" class="tog">Char 1</a></li>
					<li><a href="#" id="char3" class="tog">Char 1</a></li>
					<li><a href="#" id="char4" class="tog">Char 1</a></li>
					<li><a href="#" id="char5" class="tog">Char 1</a></li>
					<li><a href="#" id="char6" class="tog">Char 1</a></li>
					<li><a href="#" id="char7" class="tog">Add</a></li>
				</ul>
			</section>
		</nav>
	</div>
	<div class="panel hide" id="overlay">
		<a href="#" class="tog">X</a>
		<h1>Panel</h1>
	</div>
	
	<!-- JavaScript/jQuery -->
	<script src="_js/vendor/jquery.js"></script>
	<script src="_js/foundation.min.js"></script>
	  <script>
	    $(document).foundation();
	  </script>
  <script src="_js/scripts.js"></script>
</html>
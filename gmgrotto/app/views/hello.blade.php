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
			<a href="logout" class="right">Logout</a>
		</header>
	</div>
	<div  class="row medium-12 large-12">
			<div class="columns medium-5 large-5">
				
				<!-- Scratchpad -->
				<div class='row'>
					<h1>Scratchpad</h1>
					{{Form::open(array('url'=>'index', 'id'=>'scratchpad', 'class'=>'bordered')) }}
						{{ Form::textarea('notes', '', array('placeholder'=>'Notes')) }}
						{{ Form:: submit('Save', array('class'=>'large-3 medium-3 columns medium-offset-4 large-offset-4')) }}
					{{ Form::close() }}		
				</div>
				<!-- File Upload -->
				<div class='row bordered'>
					<h1>File List</h1>
					<p>Only images, pdf, txt documents are viewable.</p>
					<div class="bordered_thin fl">
						<ul>						
							@if(!empty($filelist))
								@foreach($filelist as $f)					
								<li><a href="/view/{{{ $f -> fileId }}}" class="oPanel" id="{{{ $f -> fileId }}}">{{{ $f -> filename }}}</a><a href=" delete/file/ {{{ $f -> fileId }}}" class='delete'>X</a></li>
								@endforeach
							@endif	
							@if(!empty($fi))
                                {{ $fi }}
                            @endif  					
						</ul>
					</div>
					<h1>File Upload</h1>
					{{ Form::open(array('url'=>'/', 'files'=>true, 'method'=>'POST')) }}
						{{ Form::file('newFile', array('width'=>'75%')); }}
						{{ Form::label('filename', 'File Name'); }}
						{{ Form::text('filename'); }}
						{{ Form::submit('Upload') }}
					{{ Form::close() }}
					
				</div>
			</div>
					
			<div class="columns medium-6 large-6 medium-offset-1 large-offset-1 text-centered">
				<!-- Combat Calculator Form-->
				<div class="row">
					<h1>Combat Calculator</h1>
						<div class="bordered">
							{{ Form::open(array('url'=>'index', 'id'=>'combCalc', 'class'=>'columns medium-12 large-12 bordered_thin')) }}
								<div class="row medium-12 large-12">
									{{ Form::select('char', array(
										'atlanta' => 'Atlanta',
										'aria' => 'aria',
										'aradia' => 'aradia'
									), null , array('class' => 'medium-3 large-3 columns')
									)}}
									<p class='medium-2 large-2 columns text-center'> uses </p>
									{{ Form::select('attack', array(
										'blast' => 'Blast',
										'strike' => 'Strike',
										'heal' => 'heal'
									), null , array('class' => 'medium-3 large-3 columns')
									)}}
									<p class='medium-1 large-1 columns text-center'> vs </p>
									{{ Form::select('attack', array(
										'en1' => 'Enemy 1',
										'en2' => 'Enemy 2'
									), null , array('class' => 'medium-3 large-3 columns')
									)}}
								</div>
								<div class="row medium-12 large-12">
									{{ Form::select('char', array(
										'atlanta' => 'Atlanta',
										'aria' => 'aria',
										'aradia' => 'aradia'
									), null , array('class' => 'medium-3 large-3 columns')
									)}}
									<p class='medium-2 large-2 columns text-center'> uses </p>
									{{ Form::select('attack', array(
										'blast' => 'Blast',
										'strike' => 'Strike',
										'heal' => 'heal'
									), null , array('class' => 'medium-3 large-3 columns')
									)}}
									<p class='medium-1 large-1 columns text-center'> vs </p>
									{{ Form::select('attack', array(
										'en1' => 'Enemy 1',
										'en2' => 'Enemy 2'
									), null , array('class' => 'medium-3 large-3 columns')
									)}}
								</div>
								<div class="row medium-12 large-12">
									{{ Form::select('char', array(
										'atlanta' => 'Atlanta',
										'aria' => 'aria',
										'aradia' => 'aradia'
									), null , array('class' => 'medium-3 large-3 columns')
									)}}
									<p class='medium-2 large-2 columns text-center'> uses </p>
									{{ Form::select('attack', array(
										'blast' => 'Blast',
										'strike' => 'Strike',
										'heal' => 'heal'
									), null , array('class' => 'medium-3 large-3 columns')
									)}}
									<p class='medium-1 large-1 columns text-center'> vs </p>
									{{ Form::select('attack', array(
										'en1' => 'Enemy 1',
										'en2' => 'Enemy 2'
									), null , array('class' => 'medium-3 large-3 columns')
									)}}
								</div>
								<div class="row medium-12 large-12">
									{{ Form::select('char', array(
										'atlanta' => 'Atlanta',
										'aria' => 'aria',
										'aradia' => 'aradia'
									), null , array('class' => 'medium-3 large-3 columns')
									)}}
									<p class='medium-2 large-2 columns text-center'> uses </p>
									{{ Form::select('attack', array(
										'blast' => 'Blast',
										'strike' => 'Strike',
										'heal' => 'heal'
									), null , array('class' => 'medium-3 large-3 columns')
									)}}
									<p class='medium-1 large-1 columns text-center'> vs </p>
									{{ Form::select('attack', array(
										'en1' => 'Enemy 1',
										'en2' => 'Enemy 2'
									), null , array('class' => 'medium-3 large-3 columns')
									)}}	
								</div>
									{{ Form::submit('Fight!')}}	
									{{ Form::close() }}
						<div class='row'>
							<h1>Results</h1>
							<div class="cco bordered_thin">
							<p>Results of Combat Calculator</p>
							</div>
						</div>			
				</div><!-- End Frame -->
			</div>	<!-- End of Row	-->	
		</div>	<!-- End of Column -->
		
		@if(isset($file))
            <!-- Panel -->
            <div class="panel" id="overlay">
                <a href="/exit" class="tog exit">X</a>   
                <h1>{{{$file[0]->filename}}}</h1>
                @if($file[0]->file_ext == 'jpg' || $file[0]->file_ext == 'jpeg' || $file[0]->file_ext == 'png')
                    <img src="_uploads/{{ $extPath }} " />
                @else
                    <object data="_uploads/{{ $extPath}}"></object>
                @endif
           </div>
           <!-- End of Panel -->
        @endif
        
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
	<!-- JavaScript/jQuery -->
	<script src="{{asset('_js/vendor/jquery.js')}}"></script>
	<script src="{{asset('_js/foundation.min.js')}}"></script>
	  <script>
	    $(document).foundation();
	  </script>
  <script src="{{asset('_js/scripts.js')}}"></script>
</html>

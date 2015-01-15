@extends('layouts.master')
@section('content')
<!-- Start of Left Column -->  
    <div class="columns medium-5 large-5">   
        <!-- Scratchpad -->
        <div class='row'><!-- Start of Row -->
            <h1>Scratchpad</h1>
            {{Form::open(array('url'=>'index', 'id'=>'scratchpad', 'class'=>'bordered')) }}
                {{ Form::textarea('notes', '', array('placeholder'=>'Notes', 'rows'=> 8)) }}
                {{ Form:: submit('Save', array('class'=>'large-3 medium-3 columns medium-offset-4 large-offset-4')) }}
            {{ Form::close() }}     
        </div><!-- End of Row -->
        
        <!-- File Upload -->
        <div class='row bordered'> <!-- Start of Row -->
            <h1>File List</h1>
            <p class='note'>Only images, video, pdf, and txt documents are viewable.</p>
            <div class="bordered_thin fl">
                <ul>                        
                    @if(!empty($filelist))
                        @foreach($filelist as $f)                   
                        <li><a href="/view/{{{ $f -> fileId }}}" class="oPanel" id="{{{ $f -> fileId }}}">{{{ $f -> filename }}}</a><a href=" delete/file/ {{{ $f -> fileId }}}" class='red right'>X</a></li>
                        @endforeach
                    @endif                        
                </ul>
            </div><!-- End Bordered_Thin -->
            <h1>File Upload</h1>
            {{ Form::open(array('url'=>'/', 'files'=>true, 'method'=>'POST')) }}
                {{ Form::file('newFile', array('width'=>'75%', 'required'=>'required')); }}
                {{ Form::label('filename', 'File Name'); }}
                {{ Form::text('filename', '', array( 'required' => 'required')); }}
                {{ Form::submit('Upload', array('class'=>'large-3 medium-3 columns medium-offset-4 large-offset-4')) }}
            {{ Form::close() }}
            
        </div><!-- End of Row -->
    </div><!-- End of Column -->
<!-- Start of Right Column -->             
    <div class="columns medium-6 large-6 medium-offset-1 large-offset-1 text-centered">
        <!-- Combat Calculator Form-->
        <div class="row">
            <h1>Combat Calculator</h1> 
                <div class="bordered">
                    <div class="row">
                        {{ Form::open(array('url'=>'/fight', 'method' => 'POST', 'id'=>'combCalc', 'class'=>'columns medium-12 large-12 bordered_thin')) }}
                        @if(!empty($charsList))
                        <div class="row medium-12 large-12">
                            <select class="columns medium-3 large-3">
                                @foreach($charsList as $char) }}
                                <option value='charName'>{{$char -> charName}}</option>                                                                 
                                 @endforeach   
                             </select>  
                        </div>
                        @endif                          
                            {{ Form::submit('Fight!', array('class'=>'large-3 medium-3 columns medium-offset-5 large-offset-5')) }}
                        {{ Form::close() }}
                    </div>
                    <div class='row'>
                        <h1>Results</h1>
                        <div class="cco bordered_thin">
                            @if(isset($combRes))
                              {{ $combRes }}
                            @endif
                        </div>
                    </div>          
            </div><!-- End Frame -->
        </div>  <!-- End of Row --> 
    </div>  <!-- End of Column -->
    
    @if(isset($file))
    <!-- Panel -->
        <div class="panel row" id="overlay">
            <header>
                <a href="/exit" class="tog red larger">X</a>   
                <h1>{{{$file[0]->filename}}}</h1>
                <a href="#" id="switchSize" class="larger">Large</a>
            </header>
            <div class="content text-center">
                // If An Image
                @if(in_array($file[0]->file_ext, array("png", "jpg", "jpeg", "gif")))
                    <img src="_uploads/{{ $extPath }} " />
                // If Any Other Acceptable
                @elseif(in_array($file[0]->file_ext, array("txt", "pdf", "mp4", "mp3", "mov", "swf")))
                    <object data="_uploads/{{ $extPath}}"></object>
                // Anything Else
                @else
                    <p>Sorry, but {{{ $file[0]->file_ext }}} file types are unable to be viewed in the browser.</p>
                @endif
            </div>
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
                    @if(isset($charsList))
                        @foreach($charsList as $chars)
                        <li><a href="#" id="{{{ $chars -> charId }}}" class="tog">{{{ $chars -> charName }}}</a></li>                            
                        @endforeach   
                    @endif
                    <li><a href="#" id="addChar" class="tog">Add</a></li>
                </ul>
            </section> 
        </nav>
    </div>    
@stop

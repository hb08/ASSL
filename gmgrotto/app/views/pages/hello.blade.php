@extends('layouts.master')
@section('content')

    @if(!empty(Session::get('char')))
    <pre>
        {{ print_r(Session::get('char')) }}
    </pre>
    @endif

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
    <div class="columns medium-7 large-7 text-centered">
        <!-- Combat Calculator Form-->
        <div class="row">
            <h1>Combat Calculator</h1> 
                <div class="bordered">
                    <div class="row">
                        {{ Form::open(array('url'=>'/fight', 'method' => 'POST', 'id'=>'combCalc', 'class'=>'columns medium-12 large-12 bordered_thin')) }}
                        @if(!empty($charsList))
                            @foreach($charsList as $char)
                            <div class="row bottomborder">
                                <div class="row medium-12 large-12">                                                                           
                                        <p class='medium-4 large-4 columns text-center highlight'> {{$char->charName}}</p>                                 
                                        <p class='medium-2 large-2 columns text-center'> uses </p>
                                        <select class='medium-4 large-4 columns end' name='{{$char->charId}}_attackName'>
                                                <option value="melee">Melee</option>
                                                <option value="ranged">Ranged</option>
                                                <option value="gen_attack">General Attack</option>
                                            @foreach($char->attacks as $a)
                                                <option value="{{$a -> attack_name}}">{{$a -> attack_name}}</option> 
                                            @endforeach                                       
                                        </select>  
                                </div>
                                <div class="row medium-12 large-12">  
                                    <p class='medium-1 large-1 columns medium-centered large-centered text-center'> vs </p>
                                </div>
                                <div class="row medium-12 large-12">   
                                        <div class='medium-3 large-3 columns'>
                                            <input type="text" name="{{$char->charId}}_enemyName" placeholder="Enemy Name" >
                                        </div>         
                                        <p class='medium-1 large-1 columns text-center'> for </p>
                                        <div class='medium-3 large-3 columns'>
                                            <input type="number" name="{{$char->charId}}_defenseScore" placeholder="Defense">
                                        </div>  
                                        <p class='medium-1 large-1 columns text-center end'> and </p>
                                        <div class='medium-3 large-3 columns'>                                            
                                            <input type="number" name="{{$char->charId}}_toughSave" placeholder="Toughness">
                                        </div>  
                                </div>                                                               
                             </div>   
                            @endforeach    
                        @endif                          
                            {{ Form::submit('Fight!', array('class'=>'large-3 medium-3 columns medium-offset-5 large-offset-5')) }}
                        {{ Form::close() }}
                        
                    </div>
                    <div class='row'>
                        <h1>Results</h1>
                        <a href="/clear">Clear Results</a>
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
        @include('includes.panel', ['file', $file])
    @endif
    
    @if(Session::get('addChar') == 'add')
        @include('includes.addForm')
    @endif
    
    @if(!empty(Session::get('charShow')))
        @include('includes.charForm', array('charShow' => Session::get('charShow'), 'skills' => Session::get('skills'), 'feats' => Session::get('feats') ))
    @endif
    
</div><!-- End Row -->
@include('includes.navbar', ['charsList', $charsList])
      
@stop

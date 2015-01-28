    <!-- Panel -->
        <div class="panel row ranGen {{{ $size }}}" id="overlay">
            <header>
                <a href="/exit/gen" class="tog red larger">X</a>   
                <h1>Random Enemy Generator</h1>
            </header>
            <div class="content text-center row">
                {{ Form::open(array('url'=>'/ran', 'method' => 'POST', 'id'=>'ranGen', 'class'=>'columns medium-12 large-12')) }}
                    <p>Please enter a power level to begin.</p>
                    <div class="row">
                        <div class="columns small-3 small-centered">
                            {{ Form::number('pl') }}
                        </div>
                    </div>
                    {{ Form::submit('Roll Character') }}
                {{ Form::close() }}
                @if(count($details) > 0)
                    <p>Details exist!</p>
                    <pre>
                        {{print_r($details);}}
                    </pre>  
                @endif  
            </div>
       </div>
       <!-- End of Panel -->
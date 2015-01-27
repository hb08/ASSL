    <!-- Panel -->
        <div class="panel row" id="overlay">
            <header>
                <a href="/exit/panel" class="tog red larger">X</a>   
                <h1>{{{$file[0]->filename}}}</h1>
                <a href="#" id="switchSize" class="larger">Large</a>
            </header>
            <div class="content text-center">
                <!-- If An Image -->
                @if(in_array($file[0]->file_ext, array("png", "jpg", "jpeg", "gif")))
                    <img src="_uploads/{{ $extPath }} " />
                <!--  If Any Other Acceptable-->
                @elseif(in_array($file[0]->file_ext, array("txt", "pdf", "mp4", "mp3", "mov", "swf")))
                    <object data="_uploads/{{ $extPath}}"></object>
                <!--  Anything Else -->
                @else
                    <p>Sorry, but {{{ $file[0]->file_ext }}} file types are unable to be viewed in the browser.</p>
                @endif
            </div>
       </div>
       <!-- End of Panel -->
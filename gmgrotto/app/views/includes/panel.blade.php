    <!-- Panel -->
        <div class="panel row" id="overlay">
            if(!empty($file))
                <p>file Exists</p>
            @endif
 <!--           <header>
                <a href="/exit" class="tog red larger">X</a>   
                <h1>{{{$file[0]->filename}}}</h1>
                <a href="#" id="switchSize" class="larger">Large</a>
            </header>
            <div class="content text-center">
                @if(in_array($file[0]->file_ext, array("png", "jpg", "jpeg", "gif")))
                    <img src="_uploads/{{ $extPath }} " />
                @elseif(in_array($file[0]->file_ext, array("txt", "pdf", "mp4", "mp3", "mov", "swf")))
                    <object data="_uploads/{{ $extPath}}"></object>
                @else
                    <p>Sorry, but {{{ $file[0]->file_ext }}} file types are unable to be viewed in the browser.</p>
                @endif
            </div> -->
       </div>
       <!-- End of Panel -->
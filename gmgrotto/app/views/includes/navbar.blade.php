    <div class="row">
          <!-- Navbar -->
        <nav class="top-bar" data-topbar role="navigation">          
            <section class="top-bar-section">
                <ul class="left">
                    <li @if(!empty($dice)) class="openPanel" @endif ><a href="/dice" id="d20">D20</a></li>
                    <li @if(!empty($genShow)) class="openPanel" @endif ><a href="/gen" id="eg" class="tog">Enemy Generator</a></li>
                </ul>
                <ul class="right char"> 
                    @if(isset($charsList))
                        @foreach($charsList as $chars)
                        <li @if(!empty($charShow))  @if($charShow['codeName'] == $chars -> charName) class="openPanel" @endif @endif >
                        <a href="char/view/{{{ $chars -> charId }}}" id="{{{ $chars -> charId }}}" >{{{ $chars -> charName }}}</a></li>                            
                        @endforeach   
                    @endif
                    <li @if(!empty($addShow)) class="openPanel" @endif ><a href="/addChar" id="addChar">Add</a></li>
                </ul>
            </section> 
        </nav>
    </div>
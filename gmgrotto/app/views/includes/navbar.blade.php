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
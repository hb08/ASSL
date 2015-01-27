    <!-- Panel -->
        <div class="panel row dice" id="overlay">
            <header>
                <a href="exit/dice" class="tog red larger">X</a>   
                <h1>Dice Roller</h1>
            </header>
            <div class="content text-center">
                @if(empty($rolls))
                <div class='small-centered large-centered medium-centered columns small-6 diceResults'>
                    <h1>20</h1>
                </div>
                @endif
                @if(!empty($rolls))
                    <div class="row readOut">                                            
                        @foreach($rolls as $r)
                            {{ $r }}
                        @endforeach                        
                    </div>
                @endif
                {{Form::open(array('url'=>'/roll', 'method' => 'POST', 'id'=>'diceRoll', 'class'=>'columns medium-12 large-12 ')) }}
                <!-- For each charcter -->
                @if(!empty($saves))
                <a class="columns small-12 toggleForm">Save Checks</a>
                <div class="row showForm hide"> 
                @foreach($names as $n)                                         
                        <label class="character columns small-4">{{{$n}}}</label>
                            <select class='small-4 columns' name='save_{{{$n}}}'>
                                <option value="">Select Save</option>
                            @foreach($saves as $s)
                                    @if($s->charName == $n)  
                                        <option value="t_{{{$s->tough}}}">Toughness</option> 
                                        <option value="w_{{{$s->will}}}">Will</option> 
                                        <option value="f_{{{$s->fort}}}">Fortitude</option>
                                        <option value="r_{{{$s->ref}}}">Reflex</option>                                                                 
                                    @endif                         
                             @endforeach
                             </select>  
                            <h2 class="small-1 columns">+</h2>                  
                            <input type="number" class="columns small-3 dice" name="saveMod_{{{$n}}}" placeholder="Mod"/>                                                                      
                    @endforeach                   
                @endif
                </div>
                @if(!empty($skillSelect))
                <a class="columns small-12 toggleForm">Skill Checks</a>              
                <div class="row showForm hide">
                    @foreach($names as $n)                   
                        <label class="character columns small-4">{{{$n}}}</label>
                           <select class='small-4 columns' name='skill_{{{$n}}}'>   
                               <option value="">Select Skill</option>
                                @foreach($skillSelect as $s)                                                
                                    @if($s->charName == $n) 
                                       <option value="{{{$s->skill_name}}}_{{{ $s->skill_total}}}"> {{{$s->skill_name}}}</option>
                                    @endif                              
                                @endforeach
                            </select>
                           <h2 class="small-1 columns">+</h2>                  
                           <input type="number" class="columns small-3 dice" name="saveMod_{{{$n}}}" placeholder="Mod"/>                         
                    @endforeach  
                @endif
                </div>
                @if(!empty($powers))
                <a class="columns small-12 toggleForm">Power Checks</a>
                <div class="row showForm hide"> 
                    @foreach($names as $n)                 
                        <label class="character columns small-4">{{{$n}}}</label>
                           <select class='small-4 columns' name='power_{{{$n}}}'>
                           <option value="">Select Power</option>
                            @foreach($powers as $p)
                                @if($p->charName == $n)
                                    <option value="{{{$p->power_name}}}_{{{$p->power_ranks}}}">{{{$p->power_name}}}</option>
                                @endif
                            @endforeach
                            </select>
                        <h2 class="small-1 columns">+</h2>                  
                        <input type="number" class="columns small-3 dice" name="powerMod_{{{$n}}}" placeholder="Mod"/>                    
                    @endforeach
                </div>
                @endif
                <div class="row ">
                    <hr/>
                    <div class="columns small-5">
                        <input type="text"  name="misc"  placeholder="Misc Test"/>    
                    </div>
                    <div class="columns small-3"> 
                        <input type="number" name="misc_score" placeholder="Score" />
                    </div>
                    <h2 class="small-1 columns">+</h2>
                    <div  class="columns small-3">  
                        <input type="number" name="misc_mod" placeholder="Mod" />
                    </div>
                </div>
                  {{ Form::submit('Roll Dice!', array('class'=>'small-4 columns small-offset-4', 'id'=>'dice')) }}
                  {{Form::close() }} 
                       
            </div>
       </div>
       <!-- End of Panel -->
    <!-- Panel Add Form -->
        <div class="panel row full" id="overlay">
            
            <header>
                <a href="exit/panel" class="red ">X</a>   
                <h1>{{ $charShow['codeName'] }}</h1>
                <a href="/delete/char/{{{$charShow['id']}}}" class="red">Delete</a>
            </header> 
            <div class="content text-center">
            {{ Form::open(array('url'=>'/edit/'. $charShow['id'] , 'method' => 'POST', 'id'=>'newChar', 'class'=>'columns medium-12 large-12')) }}
                <!-- Basic Information -->
                 <div class="row" >
                    <h2 class="text-center">Basic Information</h2>
                    @foreach($charShow['basic'] as $b)                   
                    <div class="row">      
                        <div class="columns large-1" >
                            <label for="name" class="inline">Name:</label>    
                        </div>
                        <div class="columns large-2" >
                            <input type="text" id="realName" name="realName" placeholder = "Real Name" value="{{{ $b->real_name }}}">                         
                        </div>
                        <div class="columns large-1" >
                            <label for="alt" class=" inline">Alias:</label>   
                        </div>
                        <div class="columns large-2" >
                             <input type="text" id="altId"  name="altId" placeholder = "Alternate Identity" value="{{ $charShow['codeName'] }}">                    
                        </div>
                        <div class="columns large-1" >
                            <label for="affi" class=" inline">Affiliation:</label>    
                        </div>
                        <div class="columns large-2" >
                            <input type="text" id="affi" name="affi" placeholder = "Affiliation" value="{{{ $b->affiliation }}}">                 
                        </div>
                        <div class="columns large-2 vert" >
                                <input type="radio" name="ff" value="0" id="friend" checked="checked"><label for="friend">Friend</label>
                                <input type="radio" name="ff" value="1" id="foe"><label for="foe">Foe</label>   
                        </div>
                    </div>                 
                    <div class="row">
                        <div class="columns large-2 small-4" >
                            <label for="pl" class=" inline">Power Level:</label>    
                        </div>
                        <div class="columns large-1 small-2" >
                            <input type="number" id="pl" name="pl" value="{{{ $b->power_level }}}">                         
                        </div>
                        <div class="columns large-2 small-4" >
                            <label for="pps" class=" inline">Power Points:</label>   
                        </div>
                        <div class="columns large-1 small-2" >
                             <input type="number" id="pps" name="pps" value="{{{ $b->power_points }}}">                    
                        </div>
                        <div class="columns large-2 small-4" >
                            <label class=" inline">Hero Points:</label>    
                        </div>
                        <div class="columns large-1 small-4" >
                            <input type="number" id="hpt" name="hpt" value="{{{ $b->hero_total }}}">                 
                        </div>
                        <div class="columns large-1 small-4 end" >
                            <input type="number" id="hpc" name="hpc"  value="{{{ $b->hero_current }}}">                 
                        </div>   
                    </div>               
                    <div class="row">
                        <div class="columns large-1 large-offset-2 small-2" >
                            <label for="height" class=" inline">Height:</label>    
                        </div>
                        <div class="columns large-1 small-2" >
                            <input type="text" id="height" name="height" value="{{{ $b->height }}}">                         
                        </div>
                        <div class="columns large-1 small-2" >
                            <label for="weight" class=" inline">Weight:</label>   
                        </div>
                        <div class="columns large-1 small-2" >
                             <input type="text" id="weight" name="weight" value="{{{ $b->weight }}}">                    
                        </div>
                        <div class="columns large-1 small-2" >
                            <label for="age" class=" inline">Age:</label>    
                        </div>
                        <div class="columns large-1 small-2 end" >
                            <input type="number" id="age" name="age" value="{{{ $b->age }}}">                 
                        </div>   
                    </div> 
                    @endforeach 
                 </div>
                 <!-- Attributes -->           
                 <div class="row">
                    <h2 class="text-center">Attributes</h2>
                    @foreach($charShow['abilities'] as $a) 
                    <div class="row">
                        <div class="columns large-4">                    
                            <div class="columns large-4 small-4" >
                                <label class=" inline">Strength:</label>    
                            </div>
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="strRank" name="strRank" placeholder = "Rank" value="{{{ $a->str_rank }}}">                         
                                </div>
                                <div class="columns large-4 small-4" >
                                     <input type="number" id="strMod" name="strMod" placeholder = "Mod" value="{{{ $a->str_mod }}}">                    
                                </div>
                        </div>
                        <div class="columns large-4">
                            <div class="columns large-4 small-4" >
                                <label class=" inline">Dexterity:</label>    
                            </div>
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="dexRank" name="dexRank" placeholder = "Rank" value="{{{ $a->dex_rank }}}">                         
                                </div>
                                <div class="columns large-4 small-4" >
                                     <input type="number" id="dexMod" name="dexMod" placeholder = "Mod" value="{{{ $a->dex_mod }}}">                    
                                </div>
                        </div>
                        <div class="columns large-4">
                            <div class="columns large-4 small-4" >
                                <label class=" inline">Constitution:</label>    
                            </div>
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="conRank" name="conRank" placeholder = "Rank" value="{{{ $a->con_rank }}}">                         
                                </div>
                                <div class="columns large-4 small-4" >
                                     <input type="number" id="conMod" name="conMod" placeholder = "Mod" value="{{{ $a->con_mod }}}">                    
                                </div>
                        </div>
                     </div>
                    <div class="row">
                        <div class="columns large-4">
                            <div class="columns large-4 small-4" >
                                <label class=" inline">Intelligence:</label>    
                            </div>
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="intRank" name="intRank" placeholder = "Rank" value="{{{ $a->int_rank }}}">                         
                                </div>
                                <div class="columns large-4 small-4" >
                                     <input type="number" id="intMod" name="intMod" placeholder = "Mod" value="{{{ $a->int_mod }}}">                    
                                </div>
                        </div>
                        <div class="columns large-4">
                            <div class="columns large-4 small-4" >
                                <label class=" inline">Wisdom:</label>    
                            </div>
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="wisRank" name="wisRank" placeholder = "Rank" value="{{{ $a->wis_rank }}}">                         
                                </div>
                                <div class="columns large-4 small-4" >
                                     <input type="number" id="wisMod" name="wisMod" placeholder = "Mod" value="{{{ $a->wis_mod }}}">                    
                                </div>
                        </div>
                        <div class="columns large-4">
                            <div class="columns large-4 small-4" >
                                <label class=" inline">Charisma:</label>    
                            </div>
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="chaRank" name="chaRank" placeholder = "Rank" value="{{{ $a->cha_rank }}}">                         
                                </div>
                                <div class="columns large-4 small-4" >
                                     <input type="number" id="chaMod" name="chaMod" placeholder = "Mod" value="{{{ $a->cha_mod }}}">                    
                                </div>
                        </div>
                     </div>
                     @endforeach
                 </div>
                 <!-- Combat --> 
                 <div class="row">
                    <h2 class="text-center">Combat</h2>
                    @foreach($charShow['combat'] as $c)  
                    <div class="row">
                        <div class="columns small-12 large-6">
                            <div class="columns   large-2  small-2" >
                                <label for="initiative" class=" inline">Initiative:</label>    
                            </div>
                            <div class="columns   large-2  small-2" >
                                <input type="number" id="initiative" name="initiative" placeholder = "" value="{{{ $c->initiative }}}">                         
                            </div>
                                                       
                            <div class="columns   large-2  small-2" >
                                <label for="attack" class=" inline">Attack:</label>    
                            </div>
                            <div class="columns  large-2  small-2">
                                <input type="number" id="attack" name="attack" placeholder = "" value="{{{ $c->gen_attack }}}">                         
                            </div>                                                                      
                                                          
                            <div class="columns   large-2  small-2" >
                                <label for="knockback" class=" inline">Knockback:</label>    
                            </div>
                            <div class="columns   large-2  small-2" >
                                <input type="number" id="knockback" name="knockback" placeholder = "" value="{{{ $c->knockback }}}">                         
                            </div>
                        </div>
                        <div class="columns small-12 large-6">
                            <div class="columns  large-2  small-2" >
                                <label class=" inline">Defense:</label>    
                            </div>
                            <div class="columns  large-2  small-2" >
                                 <input type="number" id="defense" name="defense" placeholder = "" value="{{{ $c->defense }}}">                    
                            </div>
                            
                            <div class="columns  large-2  small-2" >
                                <label class=" inline">Toughness:</label>    
                            </div>
                            <div class="columns  large-2  small-2" >
                                 <input type="number" id="toughMod" name="toughMod" placeholder = "" value="{{{ $c->tough }}}">                    
                            </div> 
                            
                            <div class="columns  large-2  small-2" >
                                <label for="grapple" class=" inline">Grapple:</label>    
                            </div>
                            <div class="columns  large-2  small-2" >
                                <input type="number" id="grapple" name="grapple" placeholder = "" value="{{{ $c->grapple }}}">                         
                            </div>                                                                                        
                        </div>
                        @endforeach
                    </div>
                    <div class="row">
                        <h3>Alternate Attacks</h3>
                        <?php $count = 1; ?>
                        <div class="columns small-12 large-6">  
                            @foreach($charShow['attacks'] as $a)
                                @if($count == 3)  
                                    </div>
                                    <div class="columns small-12 large-6">
                                @endif                                        
                                    <div class="columns large-3 small-3 large-offset-1" >
                                        <input type="text" id="{{{'aa' . $count . '_name' }}}" name="{{{'aa' . $count . '_name' }}}" placeholder = "Attack Name" value="{{{ $a->attack_name}}}">                         
                                    </div>                    
                                    <div class="columns large-2  small-3" >
                                        <input type="number" id="{{{'aa' . $count . '_score' }}}" name="{{{'aa' . $count . '_score' }}}" placeholder = ""  value="{{{ $a->attack_score }}}">                         
                                    </div>                                           
                                <?php $count +=1; ?>                   
                            @endforeach
                            @for($i = $count; $i <= 4; $i++ ) 
                                @if($i == 3)  
                                    </div>
                                    <div class="columns small-12 large-6">
                                @endif 
                                <div class="columns large-3 small-3 large-offset-1" >
                                        <input type="text" id="{{{'aa' . $i . '_name' }}}" name="{{{'aa' . $i . '_name' }}}" placeholder = "Attack Name">                         
                                    </div>                    
                                    <div class="columns large-2  small-3" >
                                        <input type="number" id="{{{'aa' . $i . '_score' }}}" name="{{{'aa' . $i . '_score' }}}" placeholder = "" >                         
                                    </div> 
                            @endfor                              
                        </div>
                    </div> 
                 </div>
                 <!-- Saves --> 
                 <div class="row">
                    <h2 class="text-center">Saves</h2> 
                     @foreach($charShow['combat'] as $c)  
                    <div class="small-12 columns large-12">
                        <div class="columns large-2 small-2" >
                            <label class=" inline">Fortitude:</label>    
                        </div>
                        <div class="columns large-2  small-2" >
                            <input type="number" id="fort" name="fort" placeholder = "" value="{{{ $c->fort }}}">                         
                        </div>      
                        <div class="columns large-2  small-2" >
                            <label class=" inline">Reflex:</label>    
                        </div>
                            <div class="columns large-2  small-2" >
                                <input type="number" id="reflex" name="reflex" placeholder = "" value="{{{ $c->ref }}}">                         
                            </div>        
                        <div class="columns large-2 small-2" >
                            <label class=" inline">Will:</label>    
                        </div>
                            <div class="columns  large-2  small-2" >
                                <input type="number" id="will" name="will" placeholder = "" value="{{{ $c->will }}}">                         
                            </div>                     
                    </div> 
                    @endforeach   
                </div>
                 <!-- Skills --> 
                 <div class="row">
                    <h2 class="text-center">Skills</h2>
                     <?php $count = 1; ?>        
                    <div class="row">
                        @foreach($charShow['skills'] as $s)
                            @if($count%3 == 1) 
                            </div>
                            <div class="row">
                            @endif                      
                        <div class="small-12 large-4 columns">
                            <select name="{{{'skill'. $count }}}" class="columns large-6 small-6">
                                @foreach($skills as $skill)
                                    @if( $skill->skill_name == $s->skill_name)
                                    <option selected>{{{ $skill->skill_name }}}</option>
                                    @else
                                    <option>{{{ $skill->skill_name }}}</option>
                                    @endif                           
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-3" >
                                    <input type="number" id="{{{'skillRank' . $count }}}" name="{{{'skillRank' . $count }}}" placeholder = "Rank" value="{{{$s->skill_ranks}}}">                         
                                </div>
                                <div class="columns large-3 small-3" >
                                     <input type="number" id="{{{'skillAbil' . $count }}}" name="{{{'skillAbil' . $count }}}" placeholder = "Abil" value="{{{$s->skill_abil}}}">                    
                                </div>
                        </div>
                        <?php $count += 1; ?>
                        @endforeach
                        @for($i = $count; $i <= 15; $i++ ) 
                            @if($count%3 == 1) 
                            </div>
                            <div class="row">
                            @endif                      
                        <div class="small-12 large-4 columns">
                            <select name="{{{'skill'. $count }}}" class="columns large-6 small-6">
                                <option></option>
                                @foreach($skills as $skill)       
                                    <option>{{{ $skill->skill_name }}}</option>                           
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-3" >
                                    <input type="number" id="{{{'skillRank' . $count }}}" name="{{{'skillRank' . $count }}}" placeholder = "Rank">                         
                                </div>
                                <div class="columns large-3 small-3" >
                                     <input type="number" id="{{{'skillAbil' . $count }}}" name="{{{'skillAbil' . $count }}}" placeholder = "Abil">                    
                                </div>
                        </div>
                        <?php $count += 1; ?>
                        @endfor                                 
                    </div>   
                 </div>
                 <!-- Feats --> 
                 <div class="row">
                    <h2 class="text-center">Feats</h2>
                    <?php $count = 1; ?>  
                    <div class="row">
                        @foreach($charShow['feats'] as $f) 
                            @if($count%4 == 1 && $count > 1) 
                                </div>
                                <div class="row">
                            @endif                      
                        <div class="small-12 large-3 columns">  
                            <select name="{{{ 'feat' . $count }}}" class="columns large-8 small-8">
                                @foreach($feats as $feat)
                                    @if( $feat->feat_name == $f->feat_name)
                                        <option selected>{{{ $feat->feat_name }}}</option>
                                    @endif
                                    <option>{{{ $feat->feat_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="{{{ 'feat' . $count . 'score'}}}" name="{{{ 'feat' . $count . 'score'}}}" placeholder  = "" value="{{{ $f->feat_ranks }}}">                         
                                </div>
                        </div>
                           <?php $count += 1; ?>  
                         @endforeach
                         @for($i = $count; $i <= 12; $i ++) 
                            @if($count%4 == 1 && $count > 1) 
                                </div>
                                <div class="row">
                            @endif                      
                            <div class="small-12 large-3 columns">  
                                <select name="{{{ 'feat' . $i }}}" class="columns large-8 small-8">
                                    <option></option>
                                    @foreach($feats as $feat)
                                        <option>{{{ $feat->feat_name }}}</option>
                                    @endforeach 
                                </select> 
                                    <div class="columns large-4 small-4" >
                                        <input type="number" id="{{{ 'feat' . $i . 'score'}}}" name="{{{ 'feat' . $i . 'score'}}}" placeholder  = "">                         
                                    </div>
                            </div>
                           <?php $count += 1; ?>  
                         @endfor       
                    </div>                        
                 </div>  
                 <!-- Powers --> 
                 <div class="row">
                    <h2 class="text-center">Powers</h2>
                    <?php $count = 1; ?>  
                    <div class="row">
                     @foreach($charShow['powers'] as $p)
                            @if($count%2 == 1 && $count > 1) 
                                </div>
                                <div class="row">
                            @endif                   
                        <div class="small-12 large-6 columns">  
                            <select name="{{{ 'power' . $count }}}" class="columns large-4 small-4">
                                @foreach($powers as $power)
                                    @if( $power->power_name == $p->power_name)
                                        <option selected>{{{ $power->power_name }}}</option>
                                    @endif
                                    <option>{{{ $power->power_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-2" >
                                    <input type="number" id="{{{ 'powerRank'  . $count }}}" name="{{{ 'powerRank'  . $count }}}" placeholder = "Rank" value="{{{ $p->power_ranks}}}">                         
                                </div>
                                <div class="columns large-5 small-6" >
                                     <input type="text" id="{{{ 'powerNote'  . $count }}}" name="{{{ 'powerNote'  . $count }}}" placeholder = "Notes" value="{{{ $p->notes}}}">                    
                                </div>
                        </div>
                           <?php $count += 1; ?>                                
                     @endforeach
                     @for($i = $count; $i <=6 ; $i++)
                            @if($i%2 == 1 && $i > 1) 
                                </div>
                                <div class="row">
                            @endif                   
                        <div class="small-12 large-6 columns">  
                            <select name="{{{ 'power' . $count }}}" class="columns large-4 small-4">
                                <option></option>
                                @foreach($powers as $power)
                                    <option>{{{ $power->power_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-2" >
                                    <input type="number" id="{{{ 'powerRank'  . $count }}}" name="{{{ 'powerRank'  . $count }}}" placeholder = "Rank">                         
                                </div>
                                <div class="columns large-5 small-6" >
                                     <input type="text" id="{{{ 'powerNote'  . $count }}}" name="{{{ 'powerNote'  . $count }}}" placeholder = "Notes">                    
                                </div>
                        </div>
                           <?php $count += 1; ?>                                
                     @endfor
                    </div> 
                </div>
                 <!-- Drawbacks --> 
                 <div class="row" >
                   <h2 class="text-center">Drawbacks</h2>
                   <?php $count = 1; ?>
                    @foreach($charShow['drawbacks'] as $d)  
                        <div class="small-12 large-6 columns"> 
                            <div class="columns large-2 small-3" >
                                <label for="{{{ 'db' . $count }}}" class=" inline">Description</label>    
                            </div>
                            <div class="columns large-8 small-6" >
                                <input type="text" id="{{{ 'db' . $count }}}" name="{{{ 'db' . $count }}}" placeholder = "Description" value="{{{$d->drawback}}}">                         
                            </div>
                            <div class="columns large-2 small-3" >
                                 <input type="number" id="{{{ 'db' . $count . 'cost' }}}" name="{{{ 'db' . $count . 'cost' }}}" placeholder = "Cost" value="{{{$d->db_cost}}}">                    
                            </div>
                        </div>
                    <?php $count += 1; ?>
                    @endforeach
                    @for($i = $count; $i <= 2; $i++)
                        <div class="small-12 large-6 columns"> 
                            <div class="columns large-2 small-3" >
                                <label for="{{{ 'db' . $count }}}" class=" inline">Description</label>    
                            </div>
                            <div class="columns large-8 small-6" >
                                <input type="text" id="{{{ 'db' . $count }}}" name="{{{ 'db' . $count }}}" placeholder = "Description">                         
                            </div>
                            <div class="columns large-2 small-3" >
                                 <input type="number" id="{{{ 'db' . $count . 'cost' }}}" name="{{{ 'db' . $count . 'cost' }}}" placeholder = "Cost">                    
                            </div>
                        </div>
                    @endfor
               </div> 
                 <!-- Submit --> 
                    {{ Form::submit('Edit Character!', array('class'=>'large-3 medium-3 columns medium-offset-5 large-offset-5')) }}
                    {{ Form::close() }}                                              
            </div>                    
       </div>
    <!-- End of Panel -->
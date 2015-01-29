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
            @if(isset($details))                    
                {{ Form::open(array('url'=>'/char', 'method' => 'POST', 'id'=>'newChar', 'class'=>'ranChar columns medium-12 large-12')) }}
                <!-- Basic Information -->
                     <div class="row" >
                        <h2 class="text-center">Basic Information</h2>
                        <div class="row">      
                            <div class="columns large-1" >
                                <label for="name" class="inline">Name:</label>    
                            </div>
                            <div class="columns large-2" >
                                <input type="text" id="realName" name="realName" placeholder = "Real Name" required>                         
                            </div>
                            <div class="columns large-1" >
                                <label for="alt" class=" inline">Alias:</label>   
                            </div>
                            <div class="columns large-2" >
                                 <input type="text" id="altId"  name="altId" placeholder = "Alternate Identity" required>                    
                            </div>
                            <div class="columns large-1" >
                                <label for="affi" class=" inline">Affiliation:</label>    
                            </div>
                            <div class="columns large-2" >
                                <input type="text" id="affi" name="affi" placeholder = "Affiliation" required>                 
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
                                <input type="number" id="pl" name="pl" value="{{{ $details['basics']['power_level'] }}}">                         
                            </div>
                            <div class="columns large-2 small-4" >
                                <label for="pps" class=" inline">Power Points:</label>   
                            </div>
                            <div class="columns large-1 small-2" >
                                 <input type="number" id="pps" name="pps" value="{{{ $details['basics']['power_points'] }}}">                    
                            </div>
                            <div class="columns large-2 small-4" >
                                <label class=" inline">Hero Points:</label>    
                            </div>
                            <div class="columns large-1 small-4" >
                                <input type="number" id="hpt" name="hpt" placeholder = "Total">                 
                            </div>
                            <div class="columns large-1 small-4 end" >
                                <input type="number" id="hpc" name="hpc" placeholder = "Current">                 
                            </div>   
                        </div>
                        <div class="row">
                            <div class="columns large-1 large-offset-2 small-2" >
                                <label for="height" class=" inline">Height:</label>    
                            </div>
                            <div class="columns large-1 small-2" >
                                <input type="text" id="height" name="height" value="{{{ $details['basics']['height'] }}}">                         
                            </div>
                            <div class="columns large-1 small-2" >
                                <label for="weight" class=" inline">Weight:</label>   
                            </div>
                            <div class="columns large-1 small-2" >
                                 <input type="text" id="weight" name="weight" value="{{{ $details['basics']['weight'] }}}">                    
                            </div>
                            <div class="columns large-1 small-2" >
                                <label for="age" class=" inline">Age:</label>    
                            </div>
                            <div class="columns large-1 small-2 end" >
                                <input type="number" id="age" name="age" value="{{{ $details['basics']['age'] }}}">                 
                            </div>   
                        </div>  
                     </div> 
                     <!-- Attributes -->           
                 <div class="row">
                    <h2 class="text-center">Attributes</h2>
                    <div class="row">
                        <div class="columns large-4">                    
                            <div class="columns large-4 small-4" >
                                <label class=" inline">Strength:</label>    
                            </div>
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="strRank" name="strRank" placeholder = "Rank" value="{{{ $details['abil']['str'] }}}">                         
                                </div>
                                <div class="columns large-4 small-4" >
                                     <input type="number" id="strMod" name="strMod" placeholder = "Mod" value="{{{ floor( ($details['abil']['str']-10)/2) }}}">                    
                                </div>
                        </div>
                        <div class="columns large-4">
                            <div class="columns large-4 small-4" >
                                <label class=" inline">Dexterity:</label>    
                            </div>
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="dexRank" name="dexRank" placeholder = "Rank" value="{{{ $details['abil']['dex'] }}}">                         
                                </div>
                                <div class="columns large-4 small-4" >
                                     <input type="number" id="dexMod" name="dexMod" placeholder = "Mod" value="{{{ floor( ($details['abil']['dex']-10)/2) }}}">                    
                                </div>
                        </div>
                        <div class="columns large-4">
                            <div class="columns large-4 small-4" >
                                <label class=" inline">Constitution:</label>    
                            </div>
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="conRank" name="conRank" placeholder = "Rank" value="{{{ $details['abil']['con'] }}}">                         
                                </div>
                                <div class="columns large-4 small-4" >
                                     <input type="number" id="conMod" name="conMod" placeholder = "Mod" value="{{{ floor( ($details['abil']['con']-10)/2) }}}">                    
                                </div>
                        </div>
                     </div>
                                         <div class="row">
                        <div class="columns large-4">
                            <div class="columns large-4 small-4" >
                                <label class=" inline">Intelligence:</label>    
                            </div>
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="intRank" name="intRank" placeholder = "Rank" value="{{{ $details['abil']['int'] }}}">                         
                                </div>
                                <div class="columns large-4 small-4" >
                                     <input type="number" id="intMod" name="intMod" placeholder = "Mod" value="{{{ floor( ($details['abil']['con']-10)/2) }}}">                    
                                </div>
                        </div>
                        <div class="columns large-4">
                            <div class="columns large-4 small-4" >
                                <label class=" inline">Wisdom:</label>    
                            </div>
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="wisRank" name="wisRank" placeholder = "Rank"  value="{{{ $details['abil']['wis'] }}}">                         
                                </div>
                                <div class="columns large-4 small-4" >
                                     <input type="number" id="wisMod" name="wisMod" placeholder = "Mod" value="{{{ floor( ($details['abil']['wis']-10)/2) }}}">                    
                                </div>
                        </div>
                        <div class="columns large-4">
                            <div class="columns large-4 small-4" >
                                <label class=" inline">Charisma:</label>    
                            </div>
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="chaRank" name="chaRank" placeholder = "Rank"  value="{{{ $details['abil']['cha'] }}}">                         
                                </div>
                                <div class="columns large-4 small-4" >
                                     <input type="number" id="chaMod" name="chaMod" placeholder = "Mod" value="{{{ floor( ($details['abil']['cha']-10)/2) }}}">                    
                                </div>
                        </div>
                     </div>
                  </div>
                  <!-- Combat --> 
                   <div class="row">
                    <h2 class="text-center">Combat</h2>
                    <div class="row">
                        <div class="columns small-12 large-6">
                            <div class="columns   large-2  small-2" >
                                <label for="initiative" class=" inline">Initiative:</label>    
                            </div>
                            <div class="columns   large-2  small-2" >
                                <input type="number" id="initiative" name="initiative" placeholder = ""   value="{{{ $details['basics']['init'] }}}">                         
                            </div>
                            <div class="columns   large-2  small-2" >
                                <label for="attack" class=" inline">Attack:</label>    
                            </div>
                            <div class="columns  large-2  small-2">
                                <input type="number" id="attack" name="attack" placeholder = "" @if(isset($details['comb/save']['gen_attack'])) value="{{{ $details['comb/save']['gen_attack'] }}}" @endif>                         
                            </div>
                            <div class="columns   large-2  small-2" >
                                <label for="knockback" class=" inline">Knockback:</label>    
                            </div>
                            <div class="columns   large-2  small-2" >
                                <input type="number" id="knockback" name="knockback" placeholder = "" value="{{{ floor( ($details['abil']['str']-10)/2) }}}">                         
                            </div>
                        </div>
                         <div class="columns small-12 large-6">
                            <div class="columns  large-2  small-2" >
                                <label class=" inline">Defense:</label>    
                            </div>
                            <div class="columns  large-2  small-2" >
                                 <input type="number" id="defense" name="defense" placeholder = "" @if(isset($details['comb/save']['defense'])) value="{{{ $details['comb/save']['defense'] }}}" @endif>                    
                            </div>
                            
                            <div class="columns  large-2  small-2" >
                                <label class=" inline">Toughness:</label>    
                            </div>
                            <div class="columns  large-2  small-2" >
                                 <input type="number" id="toughMod" name="toughMod" placeholder = "" value="{{{ $details['basics']['tough'] }}}">                    
                            </div> 
                            
                            <div class="columns  large-2  small-2" >
                                <label for="grapple" class=" inline">Grapple:</label>    
                            </div>
                            <div class="columns  large-2  small-2" >
                                <input type="number" id="grapple" name="grapple" placeholder = "" value="{{{ floor( ($details['abil']['str']-10)/2) }}}">                         
                            </div>                                                                                        
                        </div>
                    </div> 
                    <div class="row">
                        <h3>Alternate Attacks</h3>
                        <div class="columns small-12 large-6">                        
                            <div class="columns large-3 small-3 large-offset-1" >
                                <input type="text" id="aa1_name" name="aa1_name" placeholder = "Attack Name">                         
                            </div>                    
                            <div class="columns large-2  small-3" >
                                <input type="number" id="aa1_score" name="aa1_score" placeholder = "Score">                         
                            </div>
                            <div class="columns large-3 small-3 large-offset-1" >
                                <input type="text" id="aa2_name" name="aa2_name" placeholder = "Attack Name">                         
                            </div>                    
                            <div class="columns large-2  small-3" >
                                <input type="number" id="aa2_score" name="aa2_score" placeholder = "Score">                         
                            </div>                                  
                        </div>
                        <div class="columns small-12 large-6">
                            <div class="columns large-3 small-3 large-offset-1" >
                                <input type="text" id="aa3_name" name="aa3_name" placeholder = "Attack Name">                         
                            </div>                    
                            <div class="columns large-2  small-3" >
                                <input type="number" id="aa3_score" name="aa3_score" placeholder = "Score">                         
                            </div>
                            <div class="columns large-3 small-3 large-offset-1" >
                                <input type="text" id="aa4_name" name="aa4_name" placeholder = "Attack Name">                         
                            </div>                    
                            <div class="columns large-2  small-3" >
                                <input type="number" id="aa4_score" name="aa4_score" placeholder = "Score">                         
                            </div>                                  
                        </div>
                    </div> 
                 </div>
                 <!-- Saves --> 
                 <div class="row">
                    <h2 class="text-center">Saves</h2> 
                    <div class="small-12 columns large-12">
                        <div class="columns large-2 small-2" >
                            <label class=" inline">Fortitude:</label>    
                        </div>
                        <div class="columns large-2  small-2" >
                            <input type="number" id="fort" name="fort" placeholder = "" @if(isset($details['comb/save']['fort'])) value="{{{ $details['comb/save']['fort'] }}}" @endif>                         
                        </div>      
                        <div class="columns large-2  small-2" >
                            <label class=" inline">Reflex:</label>    
                        </div>
                            <div class="columns large-2  small-2" >
                                <input type="number" id="reflex" name="reflex" placeholder = "" @if(isset($details['comb/save']['ref'])) value="{{{ $details['comb/save']['ref'] }}}" @endif>                         
                            </div>        
                        <div class="columns large-2 small-2" >
                            <label class=" inline">Will:</label>    
                        </div>
                            <div class="columns  large-2  small-2" >
                                <input type="number" id="will" name="will" placeholder = "" @if(isset($details['comb/save']['will'])) value="{{{ $details['comb/save']['will'] }}}" @endif>                         
                            </div>                     
                    </div>    
                </div>    
                <!-- Skills --> 
                 <div class="row">
                    <h2 class="text-center">Skills</h2>
                     <?php $count = 1; ?>        
                    <div class="row">
                        @foreach($details['skills'] as $key=>$value)
                            @if($count%3 == 1) 
                                </div>
                                <div class="row">
                            @endif  
                            <div class="small-12 large-4 columns">
                                <select name="{{{'skill'. $count }}}" class="columns large-6 small-6">
                                    @foreach($skills as $skill)
                                        @if( $skill->skill_name == $key)
                                            <option selected>{{{ $skill->skill_name }}}</option>
                                        @else
                                            <option>{{{ $skill->skill_name }}}</option>
                                        @endif                           
                                    @endforeach 
                                </select>
                                 <div class="columns large-3 small-3" >
                                    <input type="number" id="{{{'skillRank' . $count }}}" name="{{{'skillRank' . $count }}}" placeholder = "Rank" value="{{{$value}}}">                         
                                </div> 
                                <div class="columns large-3 small-3" >
                                     <input type="number" id="{{{'skillAbil' . $count }}}" name="{{{'skillAbil' . $count }}}" placeholder = "Abil" @foreach($skills as $skill)  @if( $skill->skill_name == $key && $key != 'Language' ) value="{{{ floor(($details['abil'][$skill->skill_mod]-10)/2) }}}"  @endif @endforeach  >                    
                                </div>
                        </div>
                 <?php $count += 1; ?>
                 @endforeach
                 <?php
                 if($count > 15){
                    $rem = $count%3;
                    $total = $count + (3 - $rem);
                 }else{
                    $total = 15;
                 }
                 ?>
                   @for($i = $count; $i <= $total; $i++ ) 
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
                                 <input type="number" id="{{{'skillAbil' . $count }}}" name="{{{'skillAbil' . $count }}}" placeholder = "Abil" >                    
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
                        @foreach($details['feats'] as $key=>$value) 
                            @if($count%4 == 1 && $count > 1) 
                                </div>
                                <div class="row">
                            @endif                      
                        <div class="small-12 large-3 columns">  
                            <select name="{{{ 'feat' . $count }}}" class="columns large-8 small-8">
                                @foreach($feats as $feat)
                                    @if( $feat->feat_name == $key)
                                        <option selected>{{{ $feat->feat_name }}}</option>
                                    @endif
                                    <option>{{{ $feat->feat_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="{{{ 'feat' . $count . 'score'}}}" name="{{{ 'feat' . $count . 'score'}}}" placeholder  = "" value="{{{ $value }}}">                         
                                </div>
                        </div>
                        <?php $count += 1; ?>  
                         @endforeach
                        <?php
                             if($count > 12){
                                $rem = $count%4;
                                $total = $count + (4 - $rem);
                             }else{
                                $total = 12;
                             }
                        ?>
                         @for($i = $count; $i <= $total; $i ++) 
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
                     @foreach($details['powers'] as $key=>$value)
                            @if($count%2 == 1 && $count > 1) 
                                </div>
                                <div class="row">
                            @endif                   
                        <div class="small-12 large-6 columns">  
                            <select name="{{{ 'power' . $count }}}" class="columns large-4 small-4">
                                @foreach(Session::get('powers') as $power)
                                    @if( $power->power_name == $key)
                                        <option selected>{{{ $power->power_name }}}</option>
                                    @endif
                                    <option>{{{ $power->power_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-2" >
                                    <input type="number" id="{{{ 'powerRank'  . $count }}}" name="{{{ 'powerRank'  . $count }}}" placeholder = "Rank" @foreach(Session::get('powers') as $p) @if($p->power_name == $key) value="{{{ $value }}}" @endif @endforeach>                         
                                </div>
                                <div class="columns large-5 small-6" >
                                     <input type="text" id="{{{ 'powerNote'  . $count }}}" name="{{{ 'powerNote'  . $count }}}" placeholder = "Notes" >                    
                                </div>
                        </div>
                           <?php $count += 1; ?>                                
                     @endforeach
                     <?php 
                        if($count > 6){
                            $rem = $count%2;
                            $total = $count - $rem;
                         }else{
                            $total = 6;
                         }
                     ?>
                     @for($i = $count; $i <= $total ; $i++)
                            @if($i%2 == 1 && $i > 1) 
                                </div>
                                <div class="row">
                            @endif                   
                        <div class="small-12 large-6 columns">  
                            <select name="{{{ 'power' . $count }}}" class="columns large-4 small-4">
                                <option></option>
                                @foreach(Session::get('powers') as $power)
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
                   <div class="small-12 large-6 columns">  
                        <div class="columns large-2 small-3" >
                            <label for="db1" class=" inline">Description</label>    
                        </div>
                        <div class="columns large-8 small-6" >
                            <input type="text" id="db1" name="db1" placeholder = "Description">                         
                        </div>
                        <div class="columns large-2 small-3" >
                             <input type="number" id="db1cost" name="db1cost" placeholder = "Cost">                    
                        </div>
                    </div> 
                    <div class="small-12 large-6 columns"> 
                        <div class="columns large-2 small-3" >
                            <label for="db2" class=" inline">Description</label>    
                        </div>
                        <div class="columns large-8 small-6" >
                            <input type="text" id="db2" name="db2" placeholder = "Description">                         
                        </div>
                        <div class="columns large-2 small-3" >
                             <input type="number" id="db2cost" name="db2cost" placeholder = "Cost">                    
                        </div>
                    </div>
               </div>                                        
                <!-- Submit --> 
                    {{ Form::submit('Add Character!', array('class'=>'large-3 medium-3 columns medium-offset-5 large-offset-5')) }}
                {{ Form::close() }} 
            @endif
            </div>
            
       </div>
       <!-- End of Panel -->
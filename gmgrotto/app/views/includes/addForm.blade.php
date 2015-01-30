<!-- Panel Add Form -->
    <div class="panel row full" id="overlay">
        <header>
            <a href="exit/panel" class="tog red ">X</a>   
            <h1>Add New Character</h1>
        </header>

        <div class="content text-center">

            {{ Form::open(array('url'=>'/char', 'method' => 'POST', 'id'=>'newChar', 'class'=>'columns medium-12 large-12')) }}
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
                            <input type="number" id="pl" name="pl" required>                         
                        </div>
                        <div class="columns large-2 small-4" >
                            <label for="pps" class=" inline">Power Points:</label>   
                        </div>
                        <div class="columns large-1 small-2" >
                             <input type="number" id="pps" name="pps"  required>                    
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
                            <input type="text" id="height" name="height">                         
                        </div>
                        <div class="columns large-1 small-2" >
                            <label for="weight" class=" inline">Weight:</label>   
                        </div>
                        <div class="columns large-1 small-2" >
                             <input type="text" id="weight" name="weight" >                    
                        </div>
                        <div class="columns large-1 small-2" >
                            <label for="age" class=" inline">Age:</label>    
                        </div>
                        <div class="columns large-1 small-2 end" >
                            <input type="number" id="age" name="age">                 
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
                                    <input type="number" id="strRank" name="strRank" placeholder = "Rank" required>                         
                                </div>
                                <div class="columns large-4 small-4" >
                                     <input type="number" id="strMod" name="strMod" placeholder = "Mod" required>                    
                                </div>
                        </div>
                        <div class="columns large-4">
                            <div class="columns large-4 small-4" >
                                <label class=" inline">Dexterity:</label>    
                            </div>
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="dexRank" name="dexRank" placeholder = "Rank" required>                         
                                </div>
                                <div class="columns large-4 small-4" >
                                     <input type="number" id="dexMod" name="dexMod" placeholder = "Mod" required>                    
                                </div>
                        </div>
                        <div class="columns large-4">
                            <div class="columns large-4 small-4" >
                                <label class=" inline">Constitution:</label>    
                            </div>
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="conRank" name="conRank" placeholder = "Rank" required>                         
                                </div>
                                <div class="columns large-4 small-4" >
                                     <input type="number" id="conMod" name="conMod" placeholder = "Mod" required>                    
                                </div>
                        </div>
                     </div>
                    <div class="row">
                        <div class="columns large-4">
                            <div class="columns large-4 small-4" >
                                <label class=" inline">Intelligence:</label>    
                            </div>
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="intRank" name="intRank" placeholder = "Rank" required>                         
                                </div>
                                <div class="columns large-4 small-4" >
                                     <input type="number" id="intMod" name="intMod" placeholder = "Mod" required>                    
                                </div>
                        </div>
                        <div class="columns large-4">
                            <div class="columns large-4 small-4" >
                                <label class=" inline">Wisdom:</label>    
                            </div>
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="wisRank" name="wisRank" placeholder = "Rank" required>                         
                                </div>
                                <div class="columns large-4 small-4" >
                                     <input type="number" id="wisMod" name="wisMod" placeholder = "Mod" required>                    
                                </div>
                        </div>
                        <div class="columns large-4">
                            <div class="columns large-4 small-4" >
                                <label class=" inline">Charisma:</label>    
                            </div>
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="chaRank" name="chaRank" placeholder = "Rank" required>                         
                                </div>
                                <div class="columns large-4 small-4" >
                                     <input type="number" id="chaMod" name="chaMod" placeholder = "Mod" required>                    
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
                                <input type="number" id="initiative" name="initiative" placeholder = "" required>                         
                            </div>
                                                       
                            <div class="columns   large-2  small-2" >
                                <label for="attack" class=" inline">Attack:</label>    
                            </div>
                            <div class="columns  large-2  small-2">
                                <input type="number" id="attack" name="attack" placeholder = "" required>                         
                            </div>                                                                      
                                                          
                            <div class="columns   large-2  small-2" >
                                <label for="knockback" class=" inline">Knockback:</label>    
                            </div>
                            <div class="columns   large-2  small-2" >
                                <input type="number" id="knockback" name="knockback" placeholder = "" required>                         
                            </div>
                        </div>
                        <div class="columns small-12 large-6">
                            <div class="columns  large-2  small-2" >
                                <label class=" inline">Defense:</label>    
                            </div>
                            <div class="columns  large-2  small-2" >
                                 <input type="number" id="defense" name="defense" placeholder = "" required>                    
                            </div>
                            
                            <div class="columns  large-2  small-2" >
                                <label class=" inline">Toughness:</label>    
                            </div>
                            <div class="columns  large-2  small-2" >
                                 <input type="number" id="toughMod" name="toughMod" placeholder = "" required>                    
                            </div> 
                            
                            <div class="columns  large-2  small-2" >
                                <label for="grapple" class=" inline">Grapple:</label>    
                            </div>
                            <div class="columns  large-2  small-2" >
                                <input type="number" id="grapple" name="grapple" placeholder = "" required>                         
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
                            <input type="number" id="fort" name="fort" placeholder = "" required>                         
                        </div>      
                        <div class="columns large-2  small-2" >
                            <label class=" inline">Reflex:</label>    
                        </div>
                            <div class="columns large-2  small-2" >
                                <input type="number" id="reflex" name="reflex" placeholder = "" required>                         
                            </div>        
                        <div class="columns large-2 small-2" >
                            <label class=" inline">Will:</label>    
                        </div>
                            <div class="columns  large-2  small-2" >
                                <input type="number" id="will" name="will" placeholder = "" required>                         
                            </div>                     
                    </div>    
                </div>
                 <!-- Skills --> 
                 <div class="row">
                    <h2 class="text-center">Skills</h2>
                    <div class="row">
                        <div class="small-12 large-4 columns">
                            <select name="skill1" class="columns large-6 small-6" required>
                                <option>Skill Name</option>
                                @foreach(Session::get('skills') as $skill)
                                    <option>{{{ $skill->skill_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-3" >
                                    <input type="number" id="skillRank1" name="skillRank1" placeholder = "Rank" required>                         
                                </div>
                                <div class="columns large-3 small-3" >
                                     <input type="number" id="skillAbil1" name="skillAbil1" placeholder = "Abil" required>                    
                                </div>
                        </div> 
                        <div class="small-12 large-4 columns">
                           <select name="skill2" class="columns large-6 small-6">
                                <option>Skill Name</option>
                                @foreach(Session::get('skills') as $skill)
                                    <option>{{{ $skill->skill_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-3" >
                                    <input type="number" id="skillRank2" name="skillRank2" placeholder = "Rank">                         
                                </div>
                                <div class="columns large-3 small-3" >
                                     <input type="number" id="skillAbil2" name="skillAbil2" placeholder = "Abil">                    
                                </div>  
                       </div> 
                        <div class="small-12 large-4 columns">                         
                           <select name="skill3" class="columns large-6 small-6">
                                <option>Skill Name</option>
                                @foreach(Session::get('skills') as $skill)
                                    <option>{{{ $skill->skill_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-3" >
                                    <input type="number" id="skillRank3" name="skillRank3" placeholder = "Rank">                         
                                </div>
                                <div class="columns large-3 small-3" >
                                     <input type="number" id="skillAbil3" name="skillAbil3" placeholder = "Abil">                    
                                </div>    
                        </div>
                    </div>
                    <div class="row">
                        <div class="small-12 large-4 columns">
                            <select name="skill4" class="columns large-6 small-6">
                                <option>Skill Name</option>
                                @foreach(Session::get('skills') as $skill)
                                    <option>{{{ $skill->skill_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-3" >
                                    <input type="number" id="skillRank4" name="skillRank4" placeholder = "Rank">                         
                                </div>
                                <div class="columns large-3 small-3" >
                                     <input type="number" id="skillAbil4" name="skillAbil4" placeholder = "Abil">                    
                                </div>
                        </div> 
                        <div class="small-12 large-4 columns">
                           <select name="skill5" class="columns large-6 small-6">
                                <option>Skill Name</option>
                                @foreach(Session::get('skills') as $skill)
                                    <option>{{{ $skill->skill_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-3" >
                                    <input type="number" id="skillRank5" name="skillRank5" placeholder = "Rank">                         
                                </div>
                                <div class="columns large-3 small-3" >
                                     <input type="number" id="skillAbil5" name="skillAbil5" placeholder = "Abil">                    
                                </div>  
                        </div> 
                        <div class="small-12 large-4 columns">                           
                           <select name="skill6" class="columns large-6 small-6">
                                <option>Skill Name</option>
                                @foreach(Session::get('skills') as $skill)
                                    <option>{{{ $skill->skill_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-3" >
                                    <input type="number" id="skillRank6" name="skillRank6" placeholder = "Rank">                         
                                </div>
                                <div class="columns large-3 small-3" >
                                     <input type="number" id="skillAbil6" name="skillAbil6" placeholder = "Abil">                    
                                </div>           
                        </div>
                    </div>
                    <div class="row">
                        <div class="small-12 large-4 columns">                    
                             <select name="skill7" class="columns large-6 small-6">
                                <option>Skill Name</option>
                                @foreach(Session::get('skills') as $skill)
                                    <option>{{{ $skill->skill_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-3" >
                                    <input type="number" id="skillRank7" name="skillRank7" placeholder = "Rank">                         
                                </div>
                                <div class="columns large-3 small-3" >
                                     <input type="number" id="skillAbil7" name="skillAbil7" placeholder = "Abil">                    
                                </div>
                        </div> 
                        <div class="small-12 large-4 columns">   
                           <select name="skill8" class="columns large-6 small-6">
                                <option>Skill Name</option>
                                @foreach(Session::get('skills') as $skill)
                                    <option>{{{ $skill->skill_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-3" >
                                    <input type="number" id="skillRank8" name="skillRank8" placeholder = "Rank">                         
                                </div>
                                <div class="columns large-3 small-3" >
                                     <input type="number" id="skillAbil8" name="skillAbil8" placeholder = "Abil">                    
                                </div>  
                        </div> 
                        <div class="small-12 large-4 columns">                            
                           <select name="skill9" class="columns large-6 small-6">
                                <option>Skill Name</option>
                                @foreach(Session::get('skills') as $skill)
                                    <option>{{{ $skill->skill_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-3" >
                                    <input type="number" id="skillRank9" name="skillRank9" placeholder = "Rank">                         
                                </div>
                                <div class="columns large-3 small-3" >
                                     <input type="number" id="skillAbil9" name="skillAbil9" placeholder = "Abil">                    
                                </div>                          
                        </div>
                    </div>    
                    <div class="row">
                        <div class="small-12 large-4 columns">  
                            <select name="skill10" class="columns large-6 small-6">
                                <option>Skill Name</option>
                                @foreach(Session::get('skills') as $skill)
                                    <option>{{{ $skill->skill_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-3" >
                                    <input type="number" id="skillRank10" name="skillRank10" placeholder = "Rank">                         
                                </div>
                                <div class="columns large-3 small-3" >
                                     <input type="number" id="skillAbil10" name="skillAbil10" placeholder = "Abil">                    
                                </div>
                        </div> 
                        <div class="small-12 large-4 columns">    
                            <select name="skill11" class="columns large-6 small-6">
                                <option>Skill Name</option>
                                @foreach(Session::get('skills') as $skill)
                                    <option>{{{ $skill->skill_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-3" >
                                    <input type="number" id="skillRank11" name="skillRank11" placeholder = "Rank">                         
                                </div>
                                <div class="columns large-3 small-3" >
                                     <input type="number" id="skillAbil11" name="skillAbil11" placeholder = "Abil">                    
                                </div>                          
                        </div> 
                        <div class="small-12 large-4 columns">   
                            <select name="skill12" class="columns large-6 small-6">
                                <option>Skill Name</option>
                                @foreach(Session::get('skills') as $skill)
                                    <option>{{{ $skill->skill_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-3" >
                                    <input type="number" id="skillRank12" name="skillRank12" placeholder = "Rank">                         
                                </div>
                                <div class="columns large-3 small-3" >
                                     <input type="number" id="skillAbil12" name="skillAbil12" placeholder = "Abil">                    
                                </div>                          
                        </div>
                    </div>
                    <div class="row">                              
                        <div class="small-12 large-4 columns">  
                            <select name="skill13" class="columns large-6 small-6">
                                <option>Skill Name</option>
                                @foreach(Session::get('skills') as $skill)
                                    <option>{{{ $skill->skill_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-3" >
                                    <input type="number" id="skillRank13" name="skillRank13" placeholder = "Rank">                         
                                </div>
                                <div class="columns large-3 small-3" >
                                     <input type="number" id="skillAbil13" name="skillAbil13" placeholder = "Abil">                    
                                </div>
                         </div> 
                        <div class="small-12 large-4 columns">   
                           <select name="skill14" class="columns large-6 small-6">
                                <option>Skill Name</option>
                                @foreach(Session::get('skills') as $skill)
                                    <option>{{{ $skill->skill_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-3" >
                                    <input type="number" id="skillRank14" name="skillRank14" placeholder = "Rank">                         
                                </div>
                                <div class="columns large-3 small-3" >
                                     <input type="number" id="skillAbil14" name="skillAbil14" placeholder = "Abil">                    
                                </div>  
                         </div> 
                        <div class="small-12 large-4 columns">                           
                           <select name="skill15" class="columns large-6 small-6">
                                <option>Skill Name</option>
                                @foreach(Session::get('skills') as $skill)
                                    <option>{{{ $skill->skill_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-3" >
                                    <input type="number" id="skillRank15" name="skillRank15" placeholder = "Rank">                         
                                </div>
                                <div class="columns large-3 small-3" >
                                     <input type="number" id="skillAbil15" name="skillAbil15" placeholder = "Abil">                    
                                </div>                          
                        </div>
                    </div>   
                 </div>
                 <!-- Feats --> 
                 <div class="row">
                    <h2 class="text-center">Feats</h2>
                    <div class="row">
                        <div class="small-12 large-3 columns">  
                            <select name="feat1" class="columns large-8 small-8" required>
                                <option>Feat Name</option>
                                @foreach(Session::get('feats') as $feat)
                                    <option>{{{ $feat->feat_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="feat1score" name="feat1score" placeholder  = "" required>                         
                                </div>
                       </div> 
                       <div class="small-12 large-3 columns">   
                           <select name="feat2" class="columns large-8 small-8">
                                <option>Feat Name</option>
                                @foreach(Session::get('feats') as $feat)
                                    <option>{{{ $feat->feat_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="feat2score" name="feat2score" placeholder  = "">                         
                                </div>
 
                        </div> 
                        <div class="small-12 large-3 columns">                           
                           <select name="feat3" class="columns large-8 small-8">
                                <option>Feat Name</option>
                                @foreach(Session::get('feats') as $feat)
                                    <option>{{{ $feat->feat_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="feat3score" name="feat3score" placeholder  = "">                         
                                </div>   
                        </div>                       
                        <div class="small-12 large-3 columns">  
                            <select name="feat4" class="columns large-8 small-8">
                                <option>Feat Name</option>
                                @foreach(Session::get('feats') as $feat)
                                    <option>{{{ $feat->feat_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="feat4score" name="feat4score" placeholder  = "">                         
                                </div>

                        </div>
                     </div>  
                     <div class="row">  
                        <div class="small-12 large-3 columns">  
                            <select name="feat5" class="columns large-8 small-8">
                                <option>Feat Name</option>
                                @foreach(Session::get('feats') as $feat)
                                    <option>{{{ $feat->feat_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="feat5score" name="feat5score" placeholder  = "">                         
                                </div>
 
                        </div> 
                        <div class="small-12 large-3 columns">                          
                           <select name="feat6" class="columns large-8 small-8">
                                <option>Feat Name</option>
                                @foreach(Session::get('feats') as $feat)
                                    <option>{{{ $feat->feat_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-4 small-4">
                                    <input type="number" id="feat6score" name="feat6score" placeholder  = "">                         
                                </div>
   
                        </div>                     
                        <div class="small-12 large-3 columns">  
                            <select name="feat7" class="columns large-8 small-8">
                                <option>Feat Name</option>
                                @foreach(Session::get('feats') as $feat)
                                    <option>{{{ $feat->feat_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="feat7score" name="feat7score" placeholder  = "">                         
                                </div>

                        </div> 
                        <div class="small-12 large-3 columns">  
                           <select name="feat8" class="columns large-8 small-8">
                                <option>Feat Name</option>
                                @foreach(Session::get('feats') as $feat)
                                    <option>{{{ $feat->feat_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="feat8score" name="feat8score" placeholder  = "">                         
                                </div>
 
                       </div>
                     </div>     
                     <div class="row"> 
                        <div class="small-12 large-3 columns">                           
                           <select name="feat9" class="columns large-8 small-8">
                                <option>Feat Name</option>
                                @foreach(Session::get('feats') as $feat)
                                    <option>{{{ $feat->feat_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="feat9score" name="feat9score" placeholder  = "">                         
                                </div>
 
                        </div>                       
                        <div class="small-12 large-3 columns">  
                            <select name="feat10" class="columns large-8 small-8">
                                <option>Feat Name</option>
                                @foreach(Session::get('feats') as $feat)
                                    <option>{{{ $feat->feat_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="feat10score" name="feat10score" placeholder  = "">                         
                                </div>

                        </div> 
                        <div class="small-12 large-3 columns">  
                           <select name="feat11" class="columns large-8 small-8">
                                <option>Feat Name</option>
                                @foreach(Session::get('feats') as $feat)
                                    <option>{{{ $feat->feat_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="feat11score" name="feat11score" placeholder  = "">                         
                                </div>
 
                        </div> 
                        <div class="small-12 large-3 columns">                          
                           <select name="feat12" class="columns large-8 small-8">
                                <option>Feat Name</option>
                                @foreach(Session::get('feats') as $feat)
                                    <option>{{{ $feat->feat_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-4 small-4" >
                                    <input type="number" id="feat12score" name="feat12score" placeholder  = "">                         
                                </div>

                        </div>                          
                     </div>    
                 </div>  
                 <!-- Powers --> 
                 <div class="row">
                    <h2 class="text-center">Powers</h2> 
                    <div class="row">
                        <div class="small-12 large-6 columns"> 
                            <select name="power1" class="columns large-4 small-4" required>
                                <option>Power Name</option>
                                @foreach(Session::get('powers') as $power)
                                    <option>{{{ $power->power_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-2" >
                                    <input type="number" id="powerRank1" name="powerRank1" placeholder = "Rank" required>                         
                                </div>
                                <div class="columns large-5 small-6" >
                                     <input type="text" id="powerNote1" name="powerNote1" placeholder = "Notes">                    
                                </div>
                        </div> 
                        <div class="small-12 large-6 columns">  
                           <select name="power2" class="columns large-4 small-4">
                                <option>Power Name</option>
                                @foreach(Session::get('powers') as $power)
                                    <option>{{{ $power->power_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-2" >
                                    <input type="number" id="powerRank2" name="powerRank2" placeholder = "Rank">                         
                                </div>
                                <div class="columns large-5 small-6" >
                                     <input type="text" id="powerNote2" name="powerNote2" placeholder = "Notes">                    
                                </div>  
                        </div>
                     </div>  
                     <div class="row"> 
                        <div class="small-12 large-6 columns">                          
                           <select name="power3" class="columns large-4 small-4">
                                <option>Power Name</option>
                                @foreach(Session::get('powers') as $power)
                                    <option>{{{ $power->power_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-2" >
                                    <input type="number" id="powerRank3" name="powerRank3" placeholder = "Rank">                         
                                </div>
                                <div class="columns large-5 small-6 " >
                                     <input type="text" id="powerNote3" name="powerNote3" placeholder = "Notes">                    
                                </div> 
                        </div>                         
                        <div class="small-12 large-6 columns"> 
                            <select name="power4" class="columns large-4 small-4">
                                <option>Power Name</option>
                                @foreach(Session::get('powers') as $power)
                                    <option>{{{ $power->power_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-2" >
                                    <input type="number" id="powerRank4" name="powerRank4" placeholder = "Rank">                         
                                </div>
                                <div class="columns large-5 small-6" >
                                     <input type="text" id="powerNote4" name="powerNote4" placeholder = "Notes">                    
                                </div>
                        </div>
                     </div>  
                     <div class="row"> 
                        <div class="small-12 large-6 columns">  
                           <select name="power5" class="columns large-4 small-4">
                                <option>Power Name</option>
                                @foreach(Session::get('powers') as $power)
                                    <option>{{{ $power->power_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-2" >
                                    <input type="number" id="powerRank5" name="powerRank5" placeholder = "Rank">                         
                                </div>
                                <div class="columns large-5 small-6" >
                                     <input type="text" id="powerNote5" name="powerNote5" placeholder = "Notes">                    
                                </div>  
                        </div> 
                        <div class="small-12 large-6 columns">                          
                           <select name="power6" class="columns large-4 small-4">
                                <option>Power Name</option>
                                @foreach(Session::get('powers') as $power)
                                    <option>{{{ $power->power_name }}}</option>
                                @endforeach 
                            </select> 
                                <div class="columns large-3 small-2" >
                                    <input type="number" id="powerRank6" name="powerRank6" placeholder = "Rank">                         
                                </div>
                                <div class="columns large-5 small-6" >
                                     <input type="text" id="powerNote6" name="powerNote6" placeholder = "Notes">                    
                                </div> 
                        </div>                          
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
    </div>
</div><!-- End Panel -->

module BequestCalender
  class LunarSeason
    ######################################################################################
    #                                    Lunar Calender                                  #
    ######################################################################################
    # This establishes the basic mechanics of the Lunar Calender system that modifies    #
    # the player's base metrics on what the current lunar phase, with it being more      #
    # advised to switch to stealth mechanics during the time they are weakest, then      #
    # using the Gribatomaton for when the lunar phase when Bear Men and Kumabatto poses  #
    # the least challenge to them.                                                       #
    #                                                                                    #
    # It remains to be seen whether this will continue to be relevant as I refine this   #
    # this stealth RPG framework.                                                        #
    ######################################################################################

    def self.global_stats
      $index = 0 # Resets enemies current state, which determines default vs learning state.
      
      # Standard Operations
      $stalemates    = 0 # Keeps track of how many stalemates
      $player_struck = 0 # Keeps track of how many times player hit the enemy.
      $enemy_struck  = 0 # Keeps track of how many times enemy hit the player.

      # Amount of days in a year.
      $current_day = 0
      $lunar_ticks = 30

      ## Current Lunar Phase
      $current_phase = 0

      $player_level = 5
      $enemy_level  = 1

      # Yes or no spider
      $has_pet_spider = false

      #$cleaned           = 0 # Amount your clean up crew cleaned.
      #$contamination     = 0 # Contamination spread.
      #$day_counter       = 0 # Thirty days before the next lunar shift.
      #$zombies           = 0 # How many zombies you bludgeons or strangled.

      $baseline_hp   = 10 * $player_level
      $baseline_atk  =  4 * $player_level
      $baseline_def  =  2 * $player_level
      $baseline_heal =  2 * $player_level
      $baseline_san  = 10 * $player_level
      $baseline_tru  = 10 * $player_level

      $baseline_ehp   = 10 * $enemy_level
      $baseline_eatk  =  4 * $enemy_level
      $baseline_edef  =  2 * $enemy_level
      $baseline_eheal =  2 * $enemy_level

      $player_pos = [ 2, 2 ]
      $player_pos = [ $player_pos[0] + 1, $player_pos[1] + 1 ]
      
      $shoe_durability = 10
      $antidotes       = 10
      $emergency_ax    = 10

      # Is the player poisoned?
      $player_poison = false
    
      # It is presently unknown whether water is acidic.
      $water_acidic  = false
  
      # Does the player have a boat that can resist acid lakes?
      $player_boat   = false
  
      # Available monsters for grinding
      $acid_dragon     = 10 # 10 Acid Dragons
      $sea_gargoyal    = 15 # 15 Sea Gargoyals
      $acid_serpent    = 21 # 21 Acid Serpents
      $traitorous_nuns = 15 # 15 Nuns
    end

    def self.new_moon
      $player_hp     = $baseline_atk  * 0.2
      $player_atk    = $baseline_atk  * 0.2
      $player_def    = $baseline_def  * 0.2
      $player_heal   = $baseline_heal * 0.2
      $player_san    = $baseline_san  * 0.2
      $player_tru    = $baseline_tru  * 0.2

      $enemy_hp   = $baseline_ehp   * 0.8
      $enemy_atk  = $baseline_eatk  * 0.8
      $enemy_def  = $baseline_edef  * 0.8
      $enemy_heal = $baseline_eheal * 0.8

      $lunar_phase = "Le phase lunaire es Nouvelle Luna."
      $enemy_name  = "#{$lunar_phase} #{$fauna_type}"
    end

    def self.waxing_crescent
      $player_hp     = $baseline_atk  * 0.4
      $player_atk    = $baseline_atk  * 0.4
      $player_def    = $baseline_def  * 0.4
      $player_heal   = $baseline_heal * 0.4
      $player_san    = $baseline_san  * 0.4
      $player_tru    = $baseline_tru  * 0.4

      $enemy_hp   = $baseline_ehp   * 0.6
      $enemy_atk  = $baseline_eatk  * 0.6
      $enemy_def  = $baseline_edef  * 0.6
      $enemy_heal = $baseline_eheal * 0.6

      $lunar_phase = "Le phase lunaire es Croissant A La Cire."
      $enemy_name  = "#{$lunar_phase} #{$fauna_type}"
    end

    def self.first_quarter
      $player_hp     = $baseline_atk  * 0.6
      $player_atk    = $baseline_atk  * 0.6
      $player_def    = $baseline_def  * 0.6
      $player_heal   = $baseline_heal * 0.6
      $player_san    = $baseline_san  * 0.6
      $player_tru    = $baseline_tru  * 0.6

      $enemy_hp   = $baseline_ehp   * 0.4
      $enemy_atk  = $baseline_eatk  * 0.4
      $enemy_def  = $baseline_edef  * 0.4
      $enemy_heal = $baseline_eheal * 0.4

      $lunar_phase = "Le phase lunaire es Premier Trimestre."
      $enemy_name  = "#{$lunar_phase} #{$fauna_type}"
    end

    def self.waxing_gibbous
      $player_hp     = $baseline_atk  * 0.8
      $player_atk    = $baseline_atk  * 0.8
      $player_def    = $baseline_def  * 0.8
      $player_heal   = $baseline_heal * 0.8
      $player_san    = $baseline_san  * 0.8
      $player_tru    = $baseline_tru  * 0.8

      $enemy_hp   = $baseline_ehp   * 0.4
      $enemy_atk  = $baseline_eatk  * 0.4
      $enemy_def  = $baseline_edef  * 0.4
      $enemy_heal = $baseline_eheal * 0.4

      $lunar_phase = "Le phase lunaire es Cire De Gibbous."
      $enemy_name  = "#{$lunar_phase} #{$fauna_type}"
    end

    def self.full_moon
      $player_hp     = $baseline_atk  #* 0.2
      $player_atk    = $baseline_atk  #* 0.2
      $player_def    = $baseline_def  #* 0.2
      $player_heal   = $baseline_heal #* 0.2
      $player_san    = $baseline_san  #* 0.2
      $player_tru    = $baseline_tru  #* 0.2
		
      $enemy_hp   = $baseline_ehp   * 0.2
      $enemy_atk  = $baseline_eatk  * 0.2
      $enemy_def  = $baseline_edef  * 0.2
      $enemy_heal = $baseline_eheal * 0.2

      $lunar_phase = "Le phase lunaire es Pleine Lune."
      $enemy_name  = "#{$lunar_phase} #{$fauna_type}"
    end

    def self.waning_gibbous
      $player_hp     = $baseline_atk  * 0.6
      $player_atk    = $baseline_atk  * 0.6
      $player_def    = $baseline_def  * 0.6
      $player_heal   = $baseline_heal * 0.6
      $player_san    = $baseline_san  * 0.6
      $player_tru    = $baseline_tru  * 0.6

      $enemy_hp   = $baseline_ehp   * 0.2
      $enemy_atk  = $baseline_eatk  * 0.2
      $enemy_def  = $baseline_edef  * 0.2
      $enemy_heal = $baseline_eheal * 0.2

      $lunar_phase = "Le phase lunaire es Evetement Gibbous."
      $enemy_name  = "#{$lunar_phase} #{$fauna_type}"
    end

    def self.last_quarter
      $player_hp     = $baseline_atk  * 0.4
      $player_atk    = $baseline_atk  * 0.4
      $player_def    = $baseline_def  * 0.4
      $player_heal   = $baseline_heal * 0.4
      $player_san    = $baseline_san  * 0.4
      $player_tru    = $baseline_tru  * 0.4

      $enemy_hp   = $baseline_ehp   * 0.4
      $enemy_atk  = $baseline_eatk  * 0.4
      $enemy_def  = $baseline_edef  * 0.4
      $enemy_heal = $baseline_eheal * 0.4

      $lunar_phase = "Le phase lunaire es Dernier trimestre."
      $enemy_name  = "#{$lunar_phase} #{$fauna_type}"
    end

    def self.waning_crescent
      $player_hp     = $baseline_atk  * 0.2
      $player_atk    = $baseline_atk  * 0.2
      $player_def    = $baseline_def  * 0.2
      $player_heal   = $baseline_heal * 0.2
      $player_san    = $baseline_san  * 0.2
      $player_tru    = $baseline_tru  * 0.2

      $enemy_hp   = $baseline_ehp   * 0.6
      $enemy_atk  = $baseline_eatk  * 0.6
      $enemy_def  = $baseline_edef  * 0.6
      $enemy_heal = $baseline_eheal * 0.6

      $lunar_phase = "Le phase lunaire es Aurfeur."
      $enemy_name  = "#{$lunar_phase} #{$fauna_type}"
    end
    
    def self.evaluate_metrics
      if $hp < 1
        system("clear")
      
        puts "GAME OVER"
        
        abort
      end
    
      player_hp   = $player_hp
      player_atk  = $player_atk
      player_def  = $player_def
      player_heal = $player_heal
      player_san  = $player_san
      player_tru  = $player_tru
      
      adaptive_hp_minimum = $player_hp * 0.1250
      adaptive_hp_maximum = $player_hp - 2
      
      adaptive_atk_minimum  = $player_atk * 0.1250
      adaptive_atk_maxmimum = $player_atk - 2

      adaptive_def_minimum  = $player_def * 0.1250
      adaptive_def_maxmimum = $player_def - 2

      adaptive_heal_minimum  = $player_atk * 0.1250
      adaptive_heal_maxmimum = $player_atk - 2

      adaptive_san_minimum  = $player_san * 0.1250
      adaptive_san_maxmimum = $player_san - 2

      adaptive_tru_minimum  = $player_atk * 0.1250
      adaptive_tru_maxmimum = $player_atk - 2

      ## Notify about HP status
      current_hp = cette_int($player_hp < adaptive_hp_minimum) do
        puts "Your hit counter is below a critical threshold."
      end

      current_hp = maisette_int(current_hp, $player_hp > adaptive_hp_maximum) do
        puts "Your hit counter is presently thriving."
      end

      current_hp = sinon_int(current_hp) do
        puts "Look for potions in order to maintain your hit counter."
      end

      ## Notify about ATK status
      current_atk = cette_int($player_atk < adpative_atk_minimum) do
        puts "Your attack counter is below a critical threshold."
      end

      current_atk = maisette_int(current_atk, $player_atk > adaptive_atk_maximum) do
        puts "Your attack counter is presently thriving."
      end

      current_atk = sinon_int(current_hp) do
        puts "Look for better weapons to improve your attack counter."
      end

      ## Notify about DEF status
      current_def = cette_int($player_def < adaptive_def_minimum) do
        puts "Your defence counter is below a critical threshold."
      end

      current_def = maisette_int(current_atk, $player_def > adaptive_def_maximum) do
        puts "Your defence counter is presently thriving."
      end

      current_def = sinon_int(current_hp) do
        puts "Look for better shielding in order to maintain your defence counter."
      end
    end

    def self.lunar_cycle
      lunar_phases = [0, 1, 2, 3, 4, 5, 6, 7]

      # The current lunar phase mod 7
      current_phase  = $current_phase % 7
      #$current_phase = $current_phase + 1 % 7

      if    current_phase == lunar_phases[0]
        puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: New Moon. Réinitialisation des statistiques du joueur...\e[0m"

        sleep(1)

        BequestCalender::LunarSeason.new_moon
        BequestCalender::LunarSeason.evaluate_metrics
      elsif current_phase == lunar_phases[1]
        puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Waxing Gibbous. Réinitialisation des statistiques du joueur...\e[0m"

        sleep(1)

        BequestCalender::LunarSeason.waxing_crescent
      elsif current_phase == lunar_phases[2]
        puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Waxing Gibbous. Réinitialisation des statistiques du joueur...\e[0m"

        sleep(1)

        BequestCalender::LunarSeason.first_quarter
      elsif current_phase == lunar_phases[3]
        puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: First Quarter. Réinitialisation des statistiques du joueur...\e[0m"

        sleep(1)

        BequestCalender::LunarSeason.waxing_gibbous
      elsif current_phase == lunar_phases[4]
        puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Full_moon. Réinitialisation des statistiques du joueur...\e[0m"

        sleep(1)

        BequestCalender::LunarSeason.full_moon
      elsif current_phase == lunar_phases[5]
        puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Waning Gibbous. Réinitialisation des statistiques du joueur...\e[0m"

        sleep(1)

        BequestCalender::LunarSeason.waning_gibbous
      elsif current_phase == lunar_phases[6]
        puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Last Quarter. Réinitialisation des statistiques du joueur...\e[0m"

        sleep(1)

        BequestCalender::LunarSeason.last_quarter
      elsif current_phase == lunar_phases[7]
        puts "\e[38;2;187;127;118mLa phase lunaire actuelle est: Waning Crescent. Réinitialisation des statistiques du joueur...\e[0m"

        sleep(1)

        BequestCalender::LunarSeason.waning_crescent
      end
    end
  end
end

## That time
def self.sore_float(condition)
  if condition
    yield
    
    return true
  end
  
  false
end

def self.shikashi_float(already_done, condition)
  return true if already_done
  
  if condition
    yield
    
    return true
  end
end

def self.sonota_float(already_done)
  yield unless already_done
  
  unless already_done
    #if defined?($otherwise)
      #puts "#{$otherwise_not[0]} is 'THAT'"
      #puts "#{$otherwise_not[1]} is 'WHAT'"
    #end
  end
end

## A place of many rivers flowing together.
def self.matawa_float(already_done)
  yield unless already_done
  
  unless already_done
    #if defined?($otherwise)
      #puts "#{$otherwise_not[0]} is 'THAT'"
      #puts "#{$otherwise_not[1]} is 'WHAT'"
    #end
  end
end

## That But...
def sore_shikashi(a, b)
  "That #{a} but without #{b}"
end

## That also
def sore_matawa(a, b)
  "That #{a} but also #{b}"
end

######################################################################################################
#                                      Local Reality Zones                                           #
######################################################################################################
## Locale Reality Zones
def local_reality_zone(a, b, y1, x1, y2, x2)
  "#{a} is a local reality zone of #{b}, with #{a} having a local y of #{y1} and x of #{x1}. But #{b} itself only has a y of #{y2} and an x of #{x2}."
end

def non_euclid(a, b)
  "You can fit #{a} inside of #{b} because its exact dimensions aren't defined."
end

def non_uniform_anomaly(a, b, c, d, e, f)
  "You can fit #{a} inside of #{b} although top floors y is #{c}, and the top floors x is #{d}. The bottom floor is y of #{e} and x of #{f}."
end

## Standard Mechanics
def try_on_shoes(a, b)
  "#{a} tries on shoes #{b}."
end

def wander_halls(a, b, c)
  "#{a} wanders from #{b} to #{c}."
end

def evil_laugh(a, b)
  "#{a} evil laughed in hallway #{b}"
end

def is_haunted?(a, b, c)
  "#{a} thinks #{c} is haunted, but not #{b}."
end

def twirl_baton(a, b)
  "#{a} twirls #{b} like a baton."
end

def plant_tree(a, b)
  "Tree #{a} is planted on plot in #{b}."
end

def talk_to_tree(a, b)
  "#{a} chats with tree #{b} about its day."
end

def plant_evidence(a, b, c)
  "#{a} murders student #{c}, telling #{b} they framed them for their murder."
end

def ravenauka(a, b)
  "#{a} is chased off to the nevermore of #{b} by a demonic raven."
end

def tree_yard(a, b, c)
  d = a
  e = b
  f = c
  
  "#{d} #{e} #{f}"
end

def spot_rainbow_elephant(a, b)
  "#{a} is featured in #{b} is a rainbow elephant."
end

def argue_purpose(a, b, c)
  "#{a} has elements of #{b}, but #{c} is primarily composed of #{b}."
end

def generate_placeholder
  alpha = ["A", "B", "C", "D", "E",
           "F", "G", "H", "I", "J",
           "K", "L", "M", "N", "O",
           "P", "Q", "R", "S", "T",
           "U", "V", "W", "X", "Y",
           "Z"].shuffle
           
  a = "#{alpha.sample}#{alpha.sample}#{alpha.sample}"
  b  = "#{alpha.sample}#{alpha.sample}#{alpha.sample}#{alpha.sample}#{alpha.sample}"
  c = "#{alpha.sample}#{alpha.sample}#{alpha.sample}#{alpha.sample}#{alpha.sample}#{alpha.sample}#{alpha.sample}"
  
  chosen_word = [
    [[a, a, a], [a, a, b], [a, a, c]],
    [[b, b, a], [b, b, b], [b, b, c]],
    [[c, c, a], [c, c, b], [c, c, c]],
  ]
  
  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1, 2]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  generated_placeholder = chosen_word[cur_row][cur_col][cur_arr]
  
  "#{generated_placeholder}"
end

######################################################################################################
#                                          Greenhouse Path                                           #
######################################################################################################
def greenhouse_path(a, b)
  "#{a} is in the greenhouse of #{b}."
end

## Specify object that should be in an office bedroom.
def office_bedroom(a)
  "#{a} is an office bedroom"
end

def bedroom_coffee_maker(a, b)
  "#{a} is a room in the #{b}."
end

def specify_reality_zone(a, b, c)
  "#{a}, therefore {b} giving it the #{c} classification."
end

######################################################################################################
#                    Investigates The Entity Chevreshanshos, Or Bouc Et Shanshoo                     #
######################################################################################################

## How close to the cold apocalypse
def ceveresanexos
end

## How close to the warm apocalypse
def neceveresanexos
end

def goat_ride_salamander(a, b, c, d)
  "#{a} rides #{b} causing the end of the world, survived by #{c}. #{a} is theorized to eat lifestock, and is unknown whether to target #{d}."
end

def innocent_hour(a)
  "#{a} currently in the hour of innocense, and has tiny horns."
end

def terror_hour(a)
  "#{a} currently in the hour of terror, and has long horns."
end

def basement_ghost(a, b, c)
  "#{a} checks on noise in #{b}, and invited to dinner by #{c}. Don't eat #{c}'s food or you'll never leave #{b}."
end

def squirrel_dog_beetle(a)
  "#{a} whom looks like a mix of a squirrel, mangi dog, and beetle."
end

def ghost_upstairs(a, b)
  ghost_states = [
    [[false, false], [false, true]],
    [[true,  false], [true,  true]],
  ]

  row_options = [0, 1]
  col_options = [0, 1]
  arr_options = [0, 1]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  current_ghost = ghost_states[cur_row][cur_col][cur_arr]
  
  "#{a} is the middle management of #{b}, that has two floors above #{b}, one below the surface floor: #{current_ghost}"
end

def deer_attack(a, b)
  "Deer #{a} attack specimen #{b} as a unit of multiple deer, before #{b} wakes up."
end

def explore_bedroom(a)
  "#{a} explores the current bedroom."
end

def volume_anomaly(a, b, c, d, e, f)
  spatial_scale   = a
  house_footprint = b
  local_override  = c
  entity_presence = d
  legacy_daemon   = e
  
  statuses = ["yard only", "basement only", "main floor only", "general access"]
  
  user_status = [
    [[statuses[0], statuses[0], statuses[0], statuses[0]],
     [statuses[0], statuses[0], statuses[0], statuses[1]],
     [statuses[0], statuses[0], statuses[0], statuses[2]],
     [statuses[0], statuses[0], statuses[0], statuses[3]]],

    [[statuses[1], statuses[1], statuses[1], statuses[0]],
     [statuses[1], statuses[1], statuses[1], statuses[1]],
     [statuses[1], statuses[1], statuses[1], statuses[2]],
     [statuses[1], statuses[1], statuses[1], statuses[3]]],

    [[statuses[2], statuses[2], statuses[2], statuses[0]],
     [statuses[2], statuses[2], statuses[2], statuses[1]],
     [statuses[2], statuses[2], statuses[2], statuses[2]],
     [statuses[2], statuses[2], statuses[2], statuses[3]]],

    [[statuses[3], statuses[3], statuses[3], statuses[0]],
     [statuses[3], statuses[3], statuses[3], statuses[1]],
     [statuses[3], statuses[3], statuses[3], statuses[2]],
     [statuses[3], statuses[3], statuses[3], statuses[3]]],
  ]
  
  row_options = [0, 1, 2, 3]
  col_options = [0, 1, 2, 3]
  arr_options = [0, 1, 2, 3]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  current_status = user_status[cur_row][cur_col][cur_arr]
  
  "#{spatial_scale} #{house_footprint} #{local_override} #{entity_presence} #{legacy_daemon}"
end

######################################################################################
#                          Anos Medusahosekos De Memorie                             #
######################################################################################
def proximity_de_medusahoseki(a, b)
  maximum_distance     = b
  distance_probability = a
  
  calculation = maximum_distance - ( maximum_distance * distance_probability )
  calculation = calculation.round
  
  "Distance from Medusahoseki: #{calculation}"
end

def proximity_de_nemedusahoseki(a, b)
  maximum_distance     = b
  distance_probability = 1 - a
  
  calculation = maximum_distance - ( maximum_distance * distance_probability )
  calculation = calculation.round
  
  "Distance from Nemedusahoseki ( Salamander Riding Goat ): #{calculation}"
end

def proximity_de_memorie(a)
  year_period = 12
  
  calculation = 12 - ( 12 * a )
  calculation = calculation.round
  
  "this memory was from a prior #{calculation} year period"
end

def mperiod_sprox(a, b)
  "#{a} over #{b}"
end

def cellular_automata
  require "Medusahoseki"

  a = "~~~~~~~~~~~~~#~~~~~~~~~~~~~
~~~~#~~~~~~~#.#~~~~~~~#~~~~ 
~~~#.#~~~~~#...#~~~~~#.#~~~
~~#...#~~~~#...#~~~~#...#~~
~~#...#~~~~~#.#~~~~~#...#~~
~~~#.#~~~~~~~#~~~~~~~#.#~~~
~~~~#~~~~~~~~~~~~~~~~~#~~~~"

  b = "~~~~#~~~~~~~~~~~~~~~~~#~~~~
~~~#.#~~~~~~~#~~~~~~~#.#~~~
~~#...#~~~~~#.#~~~~~#...#~~
~~#...#~~~~#...#~~~~#...#~~
~~~#.#~~~~~#...#~~~~~#.#~~~
~~~~#~~~~~~~#.#~~~~~~~#~~~~
~~~~~~~~~~~~~#~~~~~~~~~~~~~"

  c = "~~~~#~~~~~~~~~~~~~~~~~#~~~~
~~~#.#~~~~~~~#~~~~~~~#.#~~~
~~#...#~~~~~#.#~~~~~#...#~~
~~~~~~~~~~~#...#~~~~#...#~~
~~~~~~~~~~~#...#~~~~~#.#~~~
~~~~~~~~~~~~#.#~~~~~~~#~~~~
~~~~~~~~~~~~~#~~~~~~~~~~~~~"

  d = "~~~~#~~~~~~~~~~~~~~~~~#~~~~
~~~#.#~~~~~~~#~~~~~~~#.#~~~
~~#...#~~~~~#.#~~~~~#...#~~
~~#...#~~~~#...#~~~~~~~~~~~
~~~#.#~~~~~#...#~~~~~~~~~~~
~~~~#~~~~~~~#.#~~~~~~~~~~~~
~~~~~~~~~~~~~#~~~~~~~~~~~~~"

  e = "~~~~#~~~~~~~~~~~~~~~~~#~~~~
~~~#.#~~~~~~~~~~~~~~~#.#~~~
~~#...#~~~~~~~~~~~~~#...#~~
~~#...#~~~~~~~~~~~~~#...#~~
~~~#.#~~~~~#...#~~~~~#.#~~~
~~~~#~~~~~~~#.#~~~~~~~#~~~~
~~~~~~~~~~~~~#~~~~~~~~~~~~~"

  f = "~~~~~~~~~~~~~#~~~~~~~~~~~~~
~~~~~~~~~~~~#.#~~~~~~~#~~~~ 
~~~~~~~~~~~#...#~~~~~#.#~~~
~~~~~~~~~~~#...#~~~~#...#~~
~~#...#~~~~~#.#~~~~~#...#~~
~~~#.#~~~~~~~#~~~~~~~#.#~~~
~~~~#~~~~~~~~~~~~~~~~~#~~~~"

  g = "~~~~~~~~~~~~~#~~~~~~~~~~~~~
~~~~#~~~~~~~#.#~~~~~~~~~~~~ 
~~~#.#~~~~~#...#~~~~~~~~~~~
~~#...#~~~~#...#~~~~~~~~~~~
~~#...#~~~~~#.#~~~~~#...#~~
~~~#.#~~~~~~~#~~~~~~~#.#~~~
~~~~#~~~~~~~~~~~~~~~~~#~~~~"

  h = "~~~~~~~~~~~~~~~~~~~~~~~~~~~
~~~~#~~~~~~~~~~~~~~~~~#~~~~ 
~~~#.#~~~~~~~~~~~~~~~#.#~~~
~~#...#~~~~#...#~~~~#...#~~
~~#...#~~~~~#.#~~~~~#...#~~
~~~#.#~~~~~~~#~~~~~~~#.#~~~
~~~~#~~~~~~~~~~~~~~~~~#~~~~"

  ships_sunk = [
    [[a, a, a, a, a, a, a, a],
     [a, a, a, a, a, a, a, b],
     [a, a, a, a, a, a, a, c],
     [a, a, a, a, a, a, a, d],
     [a, a, a, a, a, a, a, e],
     [a, a, a, a, a, a, a, f],
     [a, a, a, a, a, a, a, g],
     [a, a, a, a, a, a, a, h]],

    [[b, b, b, b, b, b, b, a],
     [b, b, b, b, b, b, b, b],
     [b, b, b, b, b, b, b, c],
     [b, b, b, b, b, b, b, d],
     [b, b, b, b, b, b, b, e],
     [b, b, b, b, b, b, b, f],
     [b, b, b, b, b, b, b, g],
     [b, b, b, b, b, b, b, h]],

    [[c, c, c, c, c, c, c, a],
     [c, c, c, c, c, c, c, b],
     [c, c, c, c, c, c, c, c],
     [c, c, c, c, c, c, c, d],
     [c, c, c, c, c, c, c, e],
     [c, c, c, c, c, c, c, f],
     [c, c, c, c, c, c, c, g],
     [c, c, c, c, c, c, c, h]],

    [[d, d, d, d, d, d, d, a],
     [d, d, d, d, d, d, d, b],
     [d, d, d, d, d, d, d, c],
     [d, d, d, d, d, d, d, d],
     [d, d, d, d, d, d, d, e],
     [d, d, d, d, d, d, d, f],
     [d, d, d, d, d, d, d, g],
     [d, d, d, d, d, d, d, h]],

    [[e, e, e, e, e, e, e, a],
     [e, e, e, e, e, e, e, b],
     [e, e, e, e, e, e, e, c],
     [e, e, e, e, e, e, e, d],
     [e, e, e, e, e, e, e, e],
     [e, e, e, e, e, e, e, f],
     [e, e, e, e, e, e, e, g],
     [e, e, e, e, e, e, e, h]],

    [[f, f, f, f, f, f, f, a],
     [f, f, f, f, f, f, f, b],
     [f, f, f, f, f, f, f, c],
     [f, f, f, f, f, f, f, d],
     [f, f, f, f, f, f, f, e],
     [f, f, f, f, f, f, f, f],
     [f, f, f, f, f, f, f, g],
     [f, f, f, f, f, f, f, h]],

    [[g, g, g, g, g, g, g, a],
     [g, g, g, g, g, g, g, b],
     [g, g, g, g, g, g, g, c],
     [g, g, g, g, g, g, g, d],
     [g, g, g, g, g, g, g, e],
     [g, g, g, g, g, g, g, f],
     [g, g, g, g, g, g, g, g],
     [g, g, g, g, g, g, g, h]],

    [[h, h, h, h, h, h, h, a],
     [h, h, h, h, h, h, h, b],
     [h, h, h, h, h, h, h, c],
     [h, h, h, h, h, h, h, d],
     [h, h, h, h, h, h, h, e],
     [h, h, h, h, h, h, h, f],
     [h, h, h, h, h, h, h, g],
     [h, h, h, h, h, h, h, h]],
  ]

  3.times do
    row_options = [0, 1, 2, 3, 4, 5, 6, 7]
    col_options = [0, 1, 2, 3, 4, 5, 6, 7]
    arr_options = [0, 1, 2, 3, 4, 5, 6, 7]

    cur_row = row_options.sample
    cur_col = col_options.sample
    cur_arr = arr_options.sample

    current_shipyard = ships_sunk[cur_row][cur_col][cur_arr]

    if    current_shipyard == a; puts a
    elsif current_shipyard == b; puts b
    elsif current_shipyard == c; puts c
    elsif current_shipyard == d; puts d
    elsif current_shipyard == e; puts e
    elsif current_shipyard == f; puts f
    elsif current_shipyard == g; puts g
    elsif current_shipyard == h; puts h
    else
      puts e
    end
  end

  thermodynamic_states = [
    [ :level_tre,    "The room becomes silent, except for the low hum og gears.", 0.003920842 ],
    [ :level_two, "The floor is starting to lose friction, with fog in the air.", 0.082653950 ],
    [ :level_one,                       "Residuals of ice are starting to form.", 0.189747360 ],
  ], [
    [ :level_one,                    "Surface layer of sand is starting to turn to glass.", 0.010331745 ],
    [ :level_two, "The marble on the floor is starting to soften and fabrics icinerating.", 0.020663488 ],
    [ :level_tre,                 "The room currently feels like the center of the Earth.", 0.094873680 ],
  ]

  ## Ideal Coldness
  level_one_ice = thermodynamic_states[0][2][2]
  level_two_ice = thermodynamic_states[0][1][2]
  level_tre_ice = thermodynamic_states[0][0][2]

  ## Ideal Heat
  level_one_fir = thermodynamic_states[0][0][2]
  level_two_fir = thermodynamic_states[0][1][2]
  level_tre_fir = thermodynamic_states[0][2][2]

  2.times do
    get_statistics(:level_one, "Residuals of ice are starting to form.",
                   :level_two, "The floor is starting to lose its friction, fog in the air.",
                   :level_tre, "The room becomes silent, except for the low hum of gears.")
                   
                   dynamic_mode_switcher
  end

  ideal_cold = ( level_one_ice + level_two_ice + level_tre_ice ) / $current_probability

  print "The present cold status: "

  ## First Probability
  active_state = sore_float($current_probability > ideal_cold) do
    puts "#{$current_definition}"
  
    puts mperiod_sprox(proximity_de_medusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
  end

  active_state = shikashi_float(active_state, $current_probability < ideal_cold) do
    puts "#{$current_definition}"

    puts mperiod_sprox(proximity_de_medusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
  end

  active_state = matawa_float(active_state) do
    puts "#{$current_definition}."

    puts mperiod_sprox(proximity_de_medusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
  end

  2.times do
    get_statistics(:level_one, "Surface layer of sand is starting to turn to glass",
                   :level_two, "The marble on the floor is starting to soften and fabrics icinerating.",
                   :level_tre, "The room currently feels like the center of the Earth.")
          
                   dynamic_mode_switcher
  end

  ideal_heat = ( level_one_fir + level_two_fir + level_tre_fir ) / $current_probability

  print "The present heat status: "

  ## Second Probability
  active_state = sore_float($current_probability > ideal_heat) do
    puts "#{$current_definition}"

    puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
  end

  active_state = shikashi_float(active_state, $current_probability < ideal_heat) do
    puts "#{$current_definition}"

    puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
  end

  active_state = matawa_float(active_state) do
    puts "#{$current_definition}."

    puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
  end
end

######################################################################################
#                               Statistical Model                                    #
######################################################################################
def get_statistics(a1, a2, b1, b2, c1, c2)
  a = a1, a2
  b = b1, b2
  c = c1, c2

  matrix = [
    [[a[0], a[0]], [a[0], b[0]], [a[0], c[0]]],
    [[b[0], a[0]], [b[0], b[0]], [b[0], c[0]]],
    [[c[0], a[0]], [c[0], b[0]], [c[0], c[0]]],
  ], [
    [[a[1], a[1]], [a[1], b[1]], [a[1], c[1]]],
    [[b[1], a[1]], [b[1], b[1]], [b[1], c[1]]],
    [[c[1], a[1]], [c[1], b[1]], [c[1], c[1]]],
  ], [
    [[0.50, 0.50], [0.50, 0.50], [0.50, 0.50]],
    [[0.50, 0.50], [0.50, 0.50], [0.50, 0.50]],
    [[0.50, 0.50], [0.50, 0.50], [0.50, 0.50]],
  ]

  label_type       = matrix[0]
  definition_type  = matrix[1]
  probability_type = matrix[2]
  
  row_probability = 0.33
  col_probability = 0.33
  
  graph_selection = row_probability * col_probability

  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1]

  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  current_label       = label_type[cur_row][cur_col][cur_arr]
  current_definition  = definition_type[cur_row][cur_col][cur_arr]
  current_probability = probability_type[cur_row][cur_col][cur_arr] * graph_selection
  
  "I'm confident it is not [ #{current_label} #{current_definition} ] as it has only #{current_probability} probability."
  
  $current_label       = current_label
  $current_definition  = current_definition
  $current_probability = current_probability + current_probability
  $current_information = "#{current_label} #{current_definition}"
end

def get_edge_cases(a1, a2, b1, b2, c1, c2, d1, d2, e1, e2, f1, f2)
  a = [ a1, a2 ]
  b = [ b1, b2 ]
  c = [ c1, c2 ]
  d = [ d1, d2 ]
  e = [ e1, e2 ]
  f = [ f1, f2 ]

  edges_cases = [[
    [ a[0], e[0], b[0], d[0], f[0], c[0] ],
    [ e[0], b[0], d[0], f[0], c[0], a[0] ],
    [ b[0], d[0], f[0], c[0], a[0], e[0] ],
    [ d[0], f[0], c[0], a[0], e[0], b[0] ],
    [ f[0], c[0], a[0], b[0], d[0], e[0] ],
    [ c[0], a[0], e[0], b[0], d[0], f[0] ],
  ], [
    [ a[1], e[1], b[1], d[1], f[1], c[1] ],
    [ e[1], b[1], d[1], f[1], c[1], a[1] ],
    [ b[1], d[1], f[1], c[1], a[1], e[1] ],
    [ d[1], f[1], c[1], a[1], e[1], b[1] ],
    [ f[1], c[1], a[1], b[1], d[1], e[1] ],
    [ c[1], a[1], e[1], b[1], d[1], f[1] ],
  ]]
  
  symbols      = edges_cases[0]
  descriptions = edges_cases[1]

  row_options = [0, 1, 2, 3, 4, 5]
  col_options = [0, 1, 2, 3, 4, 5]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  
  first_symbol      = symbols[cur_row][cur_col] #[cur_arr]
  first_description = descriptions[cur_row][cur_col] #[cur_arr]

  cur_row = row_options.sample
  cur_col = col_options.sample
  #cur_arr = arr_options.sample
  
  second_symbol      = symbols[cur_row][cur_col] #[cur_arr]
  second_description = descriptions[cur_row][cur_col] #[cur_arr]

  cur_row = row_options.sample
  cur_col = col_options.sample
  #cur_arr = arr_options.sample
  
  third_symbol      = symbols[cur_row][cur_col] #[cur_arr]
  third_description = descriptions[cur_row][cur_col] #[cur_arr]
  
  2.times do
    get_statistics(first_symbol,  first_description,
                   second_symbol, second_description,
                   third_symbol,  third_description)
                   
                   dynamic_reward_allocation
  end
  
  #thresholding($current_probability, 12, 12)
end

def reasses
  if $current_probability > 0.999999999999999999
    $current_probability = 0.9 / $current_probability
  end
  
  case $current_probability
  when 0.003921569000000000..0.287225000000000000
    "I'm confident it is not [ #{$current_information} ] because it has #{$current_probability}."
  when 0.287225000000000001..0.522225000000000000
    "I'm less unconfident it is not [ #{$current_information} ] because it has #{$current_probability}."
  when 0.522225000000000001..0.756112500000000000
    "I'm almost sure it is [ #{$current_information} ] because it has #{$current_probability}."
  when 0.756112500000000001..0.999999999999999999
    "I'm sure it is [ #{$current_information} ] because it has #{$current_probability}."

  else
    "The probability is either to low or to large, so I can't determine exactly."
  end
  
  $current_probability = $current_probability + $current_probability
end

def reconsider
  if $current_probability > 0.999999999999999999
    $current_probability = 0.9 / $current_probability
  end

  case $current_probability
  when 0.003921569000000000..0.287225000000000000
    "I'm confident it is not [ #{$current_information} ] because it has #{$current_probability}."
  when 0.287225000000000001..0.522225000000000000
    "I'm less unconfident it is not [ #{$current_information} ] because it has #{$current_probability}."
  when 0.522225000000000001..0.756112500000000000
    "I'm almost sure it is [ #{$current_information} ] because it has #{$current_probability}."
  when 0.756112500000000001..0.999999999999999999
    "I'm sure it is [ #{$current_information} ] because it has #{$current_probability}."
  else
    "The probability is either to low or to large, so I can't determine exactly."
  end
  
  $current_probability = $current_probability * 0.85
end

def dynamic_reward_allocation
  l1_reasses = "level one reasses"
  l2_reasses = "level two reasses"
  l3_reasses = "level tre reasses"
  l4_reasses = "level fro reasses"

  reward_model = [
    [[l1_reasses, l1_reasses, l1_reasses, l1_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l2_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l3_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l4_reasses]],
   
    [[l2_reasses, l2_reasses, l2_reasses, l1_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l2_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l3_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l4_reasses]],
   
    [[l3_reasses, l3_reasses, l3_reasses, l1_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l2_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l3_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l4_reasses]],
   
    [[l4_reasses, l4_reasses, l4_reasses, l1_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l2_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l3_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l4_reasses]],
  ]

  row_options = [0, 1, 2, 3]
  col_options = [0, 1, 2, 3]
  arr_options = [0, 1, 2, 3]

  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample

  current_reward_structure = reward_model[cur_row][cur_col][cur_arr]

  if    current_reward_structure == l1_reasses; reasses
  elsif current_reward_structure == l2_reasses; 2.times do reasses end
  elsif current_reward_structure == l3_reasses; 3.times do reasses end
  elsif current_reward_structure == l4_reasses; 4.times do reasses end
  else
    reconsider
  end
end

def dynamic_guillotine_allocation
  l1_reasses = "level one reasses"
  l2_reasses = "level two reasses"
  l3_reasses = "level tre reasses"
  l4_reasses = "level fro reasses"

  reward_model = [
    [[l1_reasses, l1_reasses, l1_reasses, l1_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l2_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l3_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l4_reasses]],
   
    [[l2_reasses, l2_reasses, l2_reasses, l1_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l2_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l3_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l4_reasses]],
   
    [[l3_reasses, l3_reasses, l3_reasses, l1_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l2_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l3_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l4_reasses]],
   
    [[l4_reasses, l4_reasses, l4_reasses, l1_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l2_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l3_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l4_reasses]],
  ]

  row_options = [0, 1, 2, 3]
  col_options = [0, 1, 2, 3]
  arr_options = [0, 1, 2, 3]

  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample

  current_reward_structure = reward_model[cur_row][cur_col][cur_arr]

  if    current_reward_structure == l1_reasses; reconsider
  elsif current_reward_structure == l2_reasses; 2.times do reconsider end
  elsif current_reward_structure == l3_reasses; 3.times do reconsider end
  elsif current_reward_structure == l4_reasses; 4.times do reconsider end
  else
    reconsider
  end
end

def dynamic_mode_switcher
  modes = [
    [["deposit", "deposit"], ["deposit", "extract"]],
    [["extract", "deposit"], ["extract", "extract"]],
  ]
  
  row_options = [0, 1]
  col_options = [0, 1]
  arr_options = [0, 1]

  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample

  current_mode = modes[cur_row][cur_col][cur_arr]

  if    current_mode == "deposit"; dynamic_reward_allocation
  elsif current_mode == "extract"; dynamic_guillotine_allocation
  else
    dynamic_guillotine_allocation
  end
end

def proximity_de_medusahoseki(a, b)
  maximum_distance     = b
  distance_probability = a
  
  calculation = maximum_distance - ( maximum_distance * distance_probability )
  calculation = calculation.round
  
  "Distance from Medusahoseki: #{calculation}"
end

def proximity_de_nemedusahoseki(a, b)
  maximum_distance     = b
  distance_probability = 1 - a
  
  calculation = maximum_distance - ( maximum_distance * distance_probability )
  calculation = calculation.round
  
  "Distance from Nemedusahoseki ( Salamander Riding Goat ): #{calculation}"
end

def proximity_de_memorie(a)
  year_period = 12
  
  calculation = 12 - ( 12 * a )
  calculation = calculation.round
  
  "this memory was from a prior #{calculation} year period"
end

def mperiod_sprox(a, b)
  "#{a} over #{b}"
end

def dynamic_reward_allocation
  l1_reasses = "level one reasses"
  l2_reasses = "level two reasses"
  l3_reasses = "level tre reasses"
  l4_reasses = "level fro reasses"

  reward_model = [
    [[l1_reasses, l1_reasses, l1_reasses, l1_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l2_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l3_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l4_reasses]],
   
    [[l2_reasses, l2_reasses, l2_reasses, l1_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l2_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l3_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l4_reasses]],
   
    [[l3_reasses, l3_reasses, l3_reasses, l1_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l2_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l3_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l4_reasses]],
   
    [[l4_reasses, l4_reasses, l4_reasses, l1_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l2_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l3_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l4_reasses]],
  ]

  row_options = [0, 1, 2, 3]
  col_options = [0, 1, 2, 3]
  arr_options = [0, 1, 2, 3]

  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample

  current_reward_structure = reward_model[cur_row][cur_col][cur_arr]

  if    current_reward_structure == l1_reasses; reasses
  elsif current_reward_structure == l2_reasses; 2.times do reasses end
  elsif current_reward_structure == l3_reasses; 3.times do reasses end
  elsif current_reward_structure == l4_reasses; 4.times do reasses end
  else
    reasses
  end
end

def dynamic_guillotine_allocation
  l1_reasses = "level one reasses"
  l2_reasses = "level two reasses"
  l3_reasses = "level tre reasses"
  l4_reasses = "level fro reasses"

  reward_model = [
    [[l1_reasses, l1_reasses, l1_reasses, l1_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l2_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l3_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l4_reasses]],
   
    [[l2_reasses, l2_reasses, l2_reasses, l1_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l2_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l3_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l4_reasses]],
   
    [[l3_reasses, l3_reasses, l3_reasses, l1_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l2_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l3_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l4_reasses]],
   
    [[l4_reasses, l4_reasses, l4_reasses, l1_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l2_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l3_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l4_reasses]],
  ]

  row_options = [0, 1, 2, 3]
  col_options = [0, 1, 2, 3]
  arr_options = [0, 1, 2, 3]

  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample

  current_reward_structure = reward_model[cur_row][cur_col][cur_arr]

  if    current_reward_structure == l1_reasses; reconsider
  elsif current_reward_structure == l2_reasses; 2.times do reconsider end
  elsif current_reward_structure == l3_reasses; 3.times do reconsider end
  elsif current_reward_structure == l4_reasses; 4.times do reconsider end
  else
    reconsider
  end
end

def dynamic_mode_switcher
  modes = [
    [["deposit", "deposit"], ["deposit", "extract"]],
    [["extract", "deposit"], ["extract", "extract"]],
  ]
  
  row_options = [0, 1]
  col_options = [0, 1]
  arr_options = [0, 1]

  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample

  current_mode = modes[cur_row][cur_col][cur_arr]

  if    current_mode == "deposit"; dynamic_reward_allocation
  elsif current_mode == "extract"; dynamic_guillotine_allocation
  else
    dynamic_guillotine_allocation
  end
end

######################################################################################################
#                                      Standard Enemy Learning                                       #
######################################################################################################
#ouvertoparle("data/player/knowledge_base/knowledge.txt", "a",
#             "Cette est un cochon, et cette est un jiraff.")

#ouvertoparle("data/player/knowledge_base/knowledge.txt", "a",
#             "Cette est un femme, et cette est un homme.")

def ouvertoparle(a, b, c)
  File.open(a, "#{b}") { |f|
    f.puts c
  }
  
  new_data = File.readlines(a)
  size_limit = new_data.size.to_i
  index = 0
  
  size_limit.times do
    puts new_data[index]
    
    index = index + 1
  end
  
  puts "Je finis!"
end

def enemy_learn
  2.times do
    get_statistics(:lure,             "lure",
                   :stun,             "stun",
                   :trap,             "trap")
                   
                   dynamic_mode_switcher
  end

  ouvertoparle("data/enemy/enemy_learned/enemy_stealth.txt", "a",
               $current_definition)
  
  2.times do
    get_statistics(:bludgeon,     "bludgeon",
                   :smash,           "smash",
                   :insenerate, "insenerate")
                   
                   dynamic_mode_switcher
  end

  ouvertoparle("data/enemy/enemy_learned/enemy_stealth.txt", "a",
               $current_definition)
                 
  2.times do
    get_statistics(:shoot,           "shoot",
                   :reclaim,       "reclaim",
                   :archive,       "archive")

    dynamic_mode_switcher
  end

  ouvertoparle("data/enemy/enemy_learned/enemy_stealth.txt", "a",
               $current_definition)
               
  $index = $index + 1
end

def gameloop
  BequestCalender::LunarSeason.lunar_cycle

  BequestCalender::LunarSeason.monitor_hp
  BequestCalender::LunarSeason.monitor_atk
  BequestCalender::LunarSeason.monitor_def
  BequestCalender::LunarSeason.monitor_heal
  BequestCalender::LunarSeason.monitor_sanity
  BequestCalender::LunarSeason.monitor_trust
  BequestCalender::LunarSeason.monitor_trauma

  BequestCalender::LunarSeason.evaluate_metrics

  comditions = {
    "lure" => "lure",
    "stun" => "trap",
    "trap" => "lure",
  }, {
    "bludgeon"   =>      "scoop",
    "scoop"      =>      "smash",
    "smash"      => "insenerate",
    "insenerate" =>   "bludgeon",
  }, {
    "shoot"   => "reclaim",
    "reclaim" => "archive",
    "archive" => "shoot",
  }
  
  index = $index
  
  ## Enemy Stealth Possibilities
  esp = ["lure", "stun", "trap"], File.readlines("data/enemy/enemy_learned/enemy_stealth.txt")
  
  emp = ["bludgeon",      "scoop",
         "smash",    "insenerate"], File.readlines("data/enemy/enemy_learned/enemy_survival.txt")
  
  eap = ["shoot", "reclaim", "archive"], File.readlines("data/enemy/enemy_learned/enemy_archival.txt")
  
  enemy_stealth = [
    [[esp[index][0], esp[index][0], esp[index][0]],
     [esp[index][0], esp[index][0], esp[index][1]],
     [esp[index][0], esp[index][0], esp[index][2]]],

    [[esp[index][1], esp[index][1], esp[index][0]],
     [esp[index][1], esp[index][1], esp[index][1]],
     [esp[index][1], esp[index][1], esp[index][2]]],

    [[esp[index][2], esp[index][2], esp[index][0]],
     [esp[index][2], esp[index][2], esp[index][1]],
     [esp[index][2], esp[index][2], esp[index][2]]],
  ]
  
  enemy_minetest = [
    [[emp[index][0], emp[index][0], emp[index][0]],
     [emp[index][0], emp[index][0], emp[index][1]],
     [emp[index][0], emp[index][0], emp[index][2]]],

    [[emp[index][1], emp[index][1], emp[index][0]],
     [emp[index][1], emp[index][1], emp[index][1]],
     [emp[index][1], emp[index][1], emp[index][2]]],

    [[emp[index][2], emp[index][2], emp[index][0]],
     [emp[index][2], emp[index][2], emp[index][1]],
     [emp[index][2], emp[index][2], emp[index][2]]],
  ]
  
  enemy_archival = [
    [[eap[index][0], eap[index][0], eap[index][0]],
     [eap[index][0], eap[index][0], eap[index][1]],
     [eap[index][0], eap[index][0], eap[index][2]]],

    [[eap[index][1], eap[index][1], eap[index][0]],
     [eap[index][1], eap[index][1], eap[index][1]],
     [eap[index][1], eap[index][1], eap[index][2]]],

    [[eap[index][2], eap[index][2], eap[index][0]],
     [eap[index][2], eap[index][2], eap[index][1]],
     [eap[index][2], eap[index][2], eap[index][2]]],
  ]
  
  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1, 2]
  
  stealth  = conditions[0]
  minetest = conditions[1]
  archival = conditions[2]
  
  print  "What is your stealth strategy? << "; saction = gets.chomp
  print "What is your survival strategy? << "; maction = gets.chomp
  print "What is your archival strategy? << "; aaction = gets.chomp
  
  current_enemy_stealth   = enemy_stealth[cur_row][cur_col][cur_arr]
  current_enemy_survival = enemy_minetest[cur_row][cur_col][cur_arr]
  current_enemy_archival = enemy_archival[cur_row][cur_col][cur_arr]
  
  if    stealth[saction]               == current_enemy_stealth # Player Stealth
  elsif stealth[current_enemy_stealth] == saction               # Enemy Stealth
  elsif stealth_enemy_action           == saction               # Stealthmate
  else
  end

  if    minetest[saction]                == current_enemy_survival # Player Survival
  elsif minetest[current_enemy_survival] == maction                # Enemy Survival
  elsif current_enemy_survival           == maction                # Survival Stalemate
  else
  end

  if    archival[saction]                == current_enemy_archival # Player Archival
  elsif archival[current_enemy_survival] == aaction                # Enemey Archival
  elsif current_enemy_archival           == aaction                # Archival Stalemate
  else
  end
end

## Specify global stats
BequestCalender::LunarSeason.global_stats

loop do
  gameplay
end

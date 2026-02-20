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

      sleep(1.5)
    end
  end
end

## Specify global stats
BequestCalender::LunarSeason.global_stats

######################################################################################################
#                                        Vortex Statistics                                           #
######################################################################################################
def vortex_statistics(a1, a2, b1, b2, c1, c2,
                      d1, d2, e1, e2, f1, f2,
                      g1, g2, h1, h2, i1, i2)

  a = a1, a2; b = b1, b2; 
  c = c1, c2; d = d1, d2; 
  e = e1, e2; f = f1, f2; 
  g = g1, g2; h = h1, h2; 
  i = i1, i2; 
  
  matrix_une = [
   [[a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], b[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], d[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], h[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], g[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], e[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], c[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], f[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], i[0]]],
  
   [[b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], a[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], d[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], h[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], g[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], e[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], c[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], f[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], i[0]]],
  
   [[d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], a[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], b[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], h[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], g[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], e[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], c[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], f[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], i[0]]],
  
   [[h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], a[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], b[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], d[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], g[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], e[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], c[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], f[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], i[0]]],
  
   [[g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], a[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], b[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], d[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], h[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], g[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], e[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], c[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], f[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], i[0]]],
  
   [[e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], a[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], b[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], d[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], h[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], g[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], c[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], f[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], i[0]]],

   [[c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], a[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], b[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], d[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], h[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], g[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], e[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], c[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], f[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], i[0]]],
  
   [[f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], a[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], b[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], d[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], h[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], g[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], e[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], c[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], i[0]]],
  
   [[i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], a[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], b[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], d[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], h[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], g[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], e[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], c[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], f[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0]]],
  ], [
   [[a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], b[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], d[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], h[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], g[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], e[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], c[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], f[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], i[1]]],
  
   [[b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], a[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], d[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], h[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], g[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], e[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], c[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], f[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], i[1]]],
  
   [[d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], a[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], b[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], h[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], g[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], e[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], c[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], f[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], i[1]]],
  
   [[h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], a[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], b[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], d[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], g[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], e[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], c[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], f[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], i[1]]],
  
   [[g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], a[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], b[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], d[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], h[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], g[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], e[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], c[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], f[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], i[1]]],

   [[e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], a[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], b[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], d[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], h[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], g[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], c[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], f[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], i[1]]],

   [[c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], a[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], b[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], d[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], h[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], g[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], e[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], c[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], f[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], i[1]]],
  
   [[f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], a[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], b[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], d[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], h[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], g[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], e[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], c[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], i[1]]],
  
   [[i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], a[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], b[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], d[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], h[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], g[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], e[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], c[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], f[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1]]],
  ], [
   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],
  ]

  matrix_deux = [
   [[a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], b[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], d[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], h[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], g[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], e[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], c[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], f[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], i[0]]],
  
   [[b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], a[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], d[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], h[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], g[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], e[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], c[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], f[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], i[0]]],
  
   [[d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], a[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], b[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], h[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], g[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], e[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], c[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], f[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], i[0]]],
  
   [[h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], a[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], b[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], d[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], g[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], e[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], c[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], f[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], i[0]]],
  
   [[g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], a[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], b[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], d[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], h[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], g[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], e[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], c[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], f[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], i[0]]],
  
   [[e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], a[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], b[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], d[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], h[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], g[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], c[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], f[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], i[0]]],

   [[c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], a[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], b[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], d[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], h[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], g[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], e[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], c[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], f[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], i[0]]],
  
   [[f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], a[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], b[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], d[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], h[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], g[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], e[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], c[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], i[0]]],
  
   [[i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], a[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], b[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], d[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], h[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], g[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], e[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], c[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], f[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0]]],
  ], [
   [[a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], b[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], d[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], h[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], g[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], e[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], c[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], f[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], i[1]]],
  
   [[b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], a[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], d[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], h[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], g[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], e[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], c[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], f[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], i[1]]],
  
   [[d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], a[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], b[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], h[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], g[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], e[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], c[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], f[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], i[1]]],
  
   [[h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], a[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], b[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], d[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], g[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], e[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], c[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], f[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], i[1]]],
  
   [[g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], a[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], b[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], d[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], h[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], g[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], e[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], c[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], f[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], i[1]]],

   [[e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], a[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], b[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], d[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], h[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], g[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], c[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], f[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], i[1]]],

   [[c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], a[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], b[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], d[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], h[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], g[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], e[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], c[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], f[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], i[1]]],
  
   [[f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], a[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], b[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], d[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], h[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], g[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], e[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], c[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], i[1]]],
  
   [[i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], a[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], b[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], d[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], h[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], g[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], e[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], c[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], f[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1]]],
  ], [
   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],
  ]

  matrix_trois = [
   [[a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], b[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], d[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], h[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], g[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], e[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], c[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], f[0]],
    [a[0], a[0], a[0], a[0], a[0], a[0], a[0], a[0], i[0]]],
  
   [[b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], a[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], d[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], h[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], g[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], e[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], c[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], f[0]],
    [b[0], b[0], b[0], b[0], b[0], b[0], b[0], b[0], i[0]]],
  
   [[d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], a[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], b[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], h[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], g[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], e[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], c[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], f[0]],
    [d[0], d[0], d[0], d[0], d[0], d[0], d[0], d[0], i[0]]],
  
   [[h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], a[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], b[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], d[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], g[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], e[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], c[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], f[0]],
    [h[0], h[0], h[0], h[0], h[0], h[0], h[0], h[0], i[0]]],
  
   [[g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], a[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], b[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], d[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], h[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], g[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], e[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], c[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], f[0]],
    [g[0], g[0], g[0], g[0], g[0], g[0], d[0], d[0], i[0]]],
  
   [[e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], a[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], b[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], d[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], h[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], g[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], c[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], f[0]],
    [e[0], e[0], e[0], e[0], e[0], e[0], e[0], e[0], i[0]]],

   [[c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], a[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], b[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], d[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], h[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], g[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], e[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], c[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], f[0]],
    [c[0], c[0], c[0], e[0], e[0], e[0], e[0], e[0], i[0]]],
  
   [[f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], a[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], b[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], d[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], h[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], g[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], e[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], c[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0]],
    [f[0], f[0], f[0], f[0], f[0], f[0], f[0], f[0], i[0]]],
  
   [[i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], a[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], b[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], d[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], h[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], g[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], e[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], c[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], f[0]],
    [i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0], i[0]]],
  ], [
   [[a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], b[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], d[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], h[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], g[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], e[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], c[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], f[1]],
    [a[1], a[1], a[1], a[1], a[1], a[1], a[1], a[1], i[1]]],
  
   [[b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], a[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], d[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], h[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], g[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], e[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], c[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], f[1]],
    [b[1], b[1], b[1], b[1], b[1], b[1], b[1], b[1], i[1]]],
  
   [[d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], a[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], b[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], h[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], g[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], e[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], c[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], f[1]],
    [d[1], d[1], d[1], d[1], d[1], d[1], d[1], d[1], i[1]]],
  
   [[h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], a[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], b[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], d[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], g[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], e[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], c[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], f[1]],
    [h[1], h[1], h[1], h[1], h[1], h[1], h[1], h[1], i[1]]],
  
   [[g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], a[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], b[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], d[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], h[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], g[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], e[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], c[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], f[1]],
    [g[1], g[1], g[1], g[1], g[1], g[1], d[1], d[1], i[1]]],

   [[e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], a[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], b[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], d[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], h[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], g[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], c[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], f[1]],
    [e[1], e[1], e[1], e[1], e[1], e[1], e[1], e[1], i[1]]],

   [[c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], a[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], b[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], d[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], h[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], g[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], e[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], c[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], f[1]],
    [c[1], c[1], c[1], e[1], e[1], e[1], e[1], e[1], i[1]]],
  
   [[f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], a[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], b[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], d[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], h[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], g[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], e[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], c[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1]],
    [f[1], f[1], f[1], f[1], f[1], f[1], f[1], f[1], i[1]]],
  
   [[i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], a[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], b[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], d[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], h[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], g[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], e[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], c[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], f[1]],
    [i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1], i[1]]],
  ], [
   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],

   [[0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33],
    [0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33, 0.33]],
  ]
  
  matrix_une_label       = matrix_une[0]
  matrix_une_description = matrix_une[1]
  matrix_une_probability = matrix_une[2]

  matrix_deux_label       = matrix_deux[0]
  matrix_deux_description = matrix_deux[1]
  metrix_deux_probability = matrix_deux[2]

  matrix_trois_label       = matrix_trois[0]
  matrix_trois_description = matrix_trois[1]
  metrix_trois_probability = matrix_trois[2]

  base_probability = 0.33 * 0.33

  ## First Selection
  row_options = [0, 1, 2, 3, 4]
  col_options = [0, 1, 2, 3, 4]
  arr_options = [0, 1, 2, 3, 4]

  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample

  $current_symbol1      = matrix_une_label[cur_row][cur_col][cur_arr]
  $current_description1 = matrix_une_description[cur_row][cur_col][cur_arr]
  $current_probability1 = base_probability * matrix_une_probability[cur_row][cur_col][cur_arr]
  $current_information1 = "#{$current_symbol1} #{$current_description1}"

  #puts "I'm confident it is not [ #{$current_symbol1}, '#{$current_description1}', #{$current_probability1} ]"
  
  ## Second Selection
  row_options = [0, 1, 2, 3, 4]
  col_options = [0, 1, 2, 3, 4]
  arr_options = [0, 1, 2, 3, 4]

  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample

  $current_symbol2      = matrix_deux_label[cur_row][cur_col][cur_arr]
  $current_description2 = matrix_deux_description[cur_row][cur_col][cur_arr]
  $current_probability2 = base_probability * metrix_deux_probability[cur_row][cur_col][cur_arr]
  $current_information2 = "#{$current_symbol2} #{$current_description2}"
  
  #puts "I'm confident it is not [ #{$current_symbol2}, '#{$current_description2}', #{$current_probability2} ]"

  ## Third Selection
  row_options = [0, 1, 2, 3, 4]
  col_options = [0, 1, 2, 3, 4]
  arr_options = [0, 1, 2, 3, 4]

  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample

  $current_symbol3      = matrix_trois_label[cur_row][cur_col][cur_arr]
  $current_description3 = matrix_trois_description[cur_row][cur_col][cur_arr]
  $current_probability3 = base_probability * metrix_trois_probability[cur_row][cur_col][cur_arr]
  $current_information3 = "#{$current_symbol3} #{$current_description3}"
  
  #puts "I'm confident it is not [ #{$current_symbol3}, '#{$current_description3}', #{$current_probability3} ]"
end

def vortex_reasses
  if $current_probability1 > 0.999999999999999999
    $current_probability1 = 0.9 / $current_probability1
  end

  if $current_probability2 > 0.999999999999999999
    $current_probability2 = 0.9 / $current_probability2
  end
  
  if $current_probability3 > 0.999999999999999999
    $current_probability3 = 0.9 / $current_probability3
  end
  
  case $current_probability1
  when 0.001371742..0.287225000000000000
    #puts "I'm confident it is not [ #{$current_information1} ] because it has #{$current_probability1}."
  when 0.287225000000000001..0.522225000000000000
    #puts "I'm less unconfident it is not [ #{$current_information1} ] because it has #{$current_probability1}."
  when 0.522225000000000001..0.756112500000000000
    #puts "I'm almost sure it is [ #{$current_information1} ] because it has #{$current_probability1}."
  when 0.756112500000000001..0.999999999999999999
    #puts "I'm sure it is [ #{$current_information1} ] because it has #{$current_probability1}."

  else
    puts "The probability is either to low or to large, so I can't determine exactly."
  end
  
  $current_probability1 = $current_probability1 + 0.25
  
  case $current_probability2
  when 0.001371742..0.287225000000000000
    #puts "I'm confident it is not [ #{$current_information2} ] because it has #{$current_probability2}."
  when 0.287225000000000001..0.522225000000000000
    #puts "I'm less unconfident it is not [ #{$current_information2} ] because it has #{$current_probability2}."
  when 0.522225000000000001..0.756112500000000000
    #puts "I'm almost sure it is [ #{$current_information2} ] because it has #{$current_probability2}."
  when 0.756112500000000001..0.999999999999999999
    #puts "I'm sure it is [ #{$current_information2} ] because it has #{$current_probability2}."

  else
    puts "The probability is either to low or to large, so I can't determine exactly."
  end
  
  $current_probability2 = $current_probability2 + 0.25
  
  case $current_probability3
  when 0.001371742..0.287225000000000000
    #puts "I'm confident it is not [ #{$current_information3} ] because it has #{$current_probability3}."
  when 0.287225000000000001..0.522225000000000000
    #puts "I'm less unconfident it is not [ #{$current_information3} ] because it has #{$current_probability3}."
  when 0.522225000000000001..0.756112500000000000
    #puts "I'm almost sure it is [ #{$current_information3} ] because it has #{$current_probability3}."
  when 0.756112500000000001..0.999999999999999999
    #puts "I'm sure it is [ #{$current_information3} ] because it has #{$current_probability3}."

  else
    puts "The probability is either to low or to large, so I can't determine exactly."
  end
  
  $current_probability3 = $current_probability3 + 0.25
end

def vortex_reconsider
  if $current_probability1 > 0.999999999999999999
    $current_probability1 = 0.9 / $current_probability1
  end

  if $current_probability2 > 0.999999999999999999
    $current_probability2 = 0.9 / $current_probability2
  end
  
  if $current_probability3 > 0.999999999999999999
    $current_probability3 = 0.9 / $current_probability3
  end
  
  case $current_probability1
  when 0.001371742..0.287225000000000000
    #puts "I'm confident it is not [ #{$current_information1} ] because it has #{$current_probability1}."
  when 0.287225000000000001..0.522225000000000000
    #puts "I'm less unconfident it is not [ #{$current_information1} ] because it has #{$current_probability1}."
  when 0.522225000000000001..0.756112500000000000
    #puts "I'm almost sure it is [ #{$current_information1} ] because it has #{$current_probability1}."
  when 0.756112500000000001..0.999999999999999999
    #puts "I'm sure it is [ #{$current_information1} ] because it has #{$current_probability1}."

  else
    puts "The probability is either to low or to large, so I can't determine exactly."
  end
  
  $current_probability1 = $current_probability1 * 0.80
  
  case $current_probability2
  when 0.001371742..0.287225000000000000
    #puts "I'm confident it is not [ #{$current_information2} ] because it has #{$current_probability2}."
  when 0.287225000000000001..0.522225000000000000
    #puts "I'm less unconfident it is not [ #{$current_information2} ] because it has #{$current_probability2}."
  when 0.522225000000000001..0.756112500000000000
    #puts "I'm almost sure it is [ #{$current_information2} ] because it has #{$current_probability2}."
  when 0.756112500000000001..0.999999999999999999
    #puts "I'm sure it is [ #{$current_information2} ] because it has #{$current_probability2}."

  else
    puts "The probability is either to low or to large, so I can't determine exactly."
  end
  
  $current_probability2 = $current_probability2 * 0.80
  
  case $current_probability3
  when 0.001371742..0.287225000000000000
    #puts "I'm confident it is not [ #{$current_information3} ] because it has #{$current_probability3}."
  when 0.287225000000000001..0.522225000000000000
    #puts "I'm less unconfident it is not [ #{$current_information3} ] because it has #{$current_probability3}."
  when 0.522225000000000001..0.756112500000000000
    #puts "I'm almost sure it is [ #{$current_information3} ] because it has #{$current_probability3}."
  when 0.756112500000000001..0.999999999999999999
    #puts "I'm sure it is [ #{$current_information3} ] because it has #{$current_probability3}."

  else
    puts "The probability is either to low or to large, so I can't determine exactly."
  end
  
  $current_probability3 = $current_probability3 * 0.80
end

def vortex_reward_allocation
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

  if    current_reward_structure == l1_reasses; vortex_reasses
  elsif current_reward_structure == l2_reasses; 2.times do vortex_reasses end
  elsif current_reward_structure == l3_reasses; 3.times do vortex_reasses end
  elsif current_reward_structure == l4_reasses; 4.times do vortex_reasses end
  else
    vortex_reasses
  end
end

def vortex_guillotine_allocation
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

  if    current_reward_structure == l1_reasses; vortex_reconsider
  elsif current_reward_structure == l2_reasses; 2.times do vortex_reconsider end
  elsif current_reward_structure == l3_reasses; 3.times do vortex_reconsider end
  elsif current_reward_structure == l4_reasses; 4.times do vortex_reconsider end
  else
    vortex_reconsider
  end
end

def vortex_mode_switcher
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

  vortex_statistics(:lure,             "lure",
                    :stun,             "stun",
                    :trap,             "trap",
                    :bludgeon,     "bludgeon",
                    :smash,           "smash",
                    :insenerate, "insenerate",                  
                    :shoot,           "shoot",
                    :reclaim,       "reclaim",
                    :archive,       "archive")

    vortex_mode_switcher                
  end
  
  ouvertoparle("data/enemy/enemy_learned/enemy_stealth.txt", "a",
               $current_information1)

  ouvertoparle("data/enemy/enemy_learned/enemy_survival.txt", "a",
               $current_information2)
               
  ouvertoparle("data/enemy/enemy_learned/enemy_archival.txt", "a",
               $current_information3)
               
               $index = $index + 1
end

def gameloop
  BequestCalender::LunarSeason.monitor_hp
  BequestCalender::LunarSeason.monitor_atk
  BequestCalender::LunarSeason.monitor_def
  BequestCalender::LunarSeason.monitor_heal
  BequestCalender::LunarSeason.monitor_sanity
  BequestCalender::LunarSeason.monitor_trust
  BequestCalender::LunarSeason.monitor_trauma

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

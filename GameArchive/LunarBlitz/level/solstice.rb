# Corrupt   >> Recover
# Recover   >> Abandoned
# Abandoned >> Corrupt

# If something is corrupted, it can be recovered. If recovered it can be abandoned. If Abandoned can be corrupted.

# Corrupted monsters are resistant to recovery. Recovered monsters are less likely to be abandoned. Abandoned monster are at increased risk of being corrupted, like aged software.

# Recover can be beat corruption if you solve a puzzle. Unsolved puzzles risk being abandoned, and therefore at increased risk of corruption.
def monster_name
  def five_elements
    possible_elements = File.readlines("lib/monsternames/elements.txt")

    $chosen_element = possible_elements.sample.strip.to_s
  end

  def adjectives
    possible_adjectives = File.readlines("lib/monsternames/gendered_adverb.txt")

    $chosen_adjective = possible_adjectives.sample.strip.to_s 
  end
end 

monster_name.five_elements
monster_name.adjectives

$mob_name = "#{$chosen_element} #{$chosen_adjective}"

def corruption_routine
  chances_of_corruption = {
    "uirusu"            => "ver",
    "ver"               => "ninja",
    "ninja"             => "articles de supai", # Articles of penetration testing.
    "articles de supai" => "kaunta uirusu",
    "kaunta uirusu"     => "uirusu",
  }

  corruption_rates = [
    "uirusu",            "ver",           "ninja",
    "articles de supai", "kaunta uirusu",
  ]

  puts "[ uirusu ] [ ver ] [ ninja ] [ article de supai ] [ kaunta uirusu ]"

  print "What malware would you like to use to attack the #{$mob_name}? << "
  @player_success  = gets.chomp

  @monster_success = corruption_rates.sample

  puts "Monster Actions: #{@monster_success}"
  
  if    chances_of_corruption[@player_success]  == @monster_success
    $player_corruption = $player_corruption + 2

    print ">> You've failed to corrupt #{$current_monster_name}: #{$enemy_corruption}"
  elsif chances_of_corruption[@monster_success] == @player_success
    $enemy_corruption  = $enemy_corruption  - 2

    print ">> You've successfully corrupted #{$current_monster_name}: #{$corruption}"
  elsif @player_success == @monster_success # Stalemate condition
    print ">> Neither you or #{$current_monster_name} successfully corrupted any firmware."
  elsif @player_success == "sketchy"
    $enemy_corruption = $enemy_corruption + 1

    print ">> Your corruption attempt of the monster was somewhat successful: #{$enemy_corruption}"    
  elsif @monster_success == "sketchy"
    $player_corruption = $player_corruption + 1

    print ">> Your corruption attempt of the monster was somewhat successful: #{$enemy_corruption}"
  else
    puts ">> This is not a valid option."
  end

  gets.chomp
end

def recovery_routine
  chances_of_recovery = {
    "kurincache"       => "hakkenplieur",
    "hakkenplieur"     => "kuriannavigateur",
    "kurianavigateur"  => "reinitialization",
    "reinitialization" => "kurincache",
  }

  recovery_rates = [
    "hakkenplieur",    "kuriannavigateur",
    "kurianavigateur", "reinitialization",
    "kurincache",
  ]

  puts "[ kurincache ] [ hakkenplieur ] [ kuriannavigateur ] [ reinitialization ]"

  print "What recovery tactic would you like to use to counter the #{$mob_name} advances? << "
  @player_success  = gets.chomp

  @monster_success = recovery_rates.sample
  
  puts "Monster Actions: #{@monster_success}"

  if    chances_of_recovery[@player_success]  == @monster_success
    $enemy_corruption = $enemy_corruption - 2
    $player_corruption = $player_corruption + 1    

    puts ">> You've failed to recover your own corruption: #{$player_corruption}"
    puts ">> #{$current_monster_name} succesfully recovered from corruption: #{$enemy_corruption}"

  elsif chances_of_recovery[@monster_success] == @player_success
    $enemy_corruption = $enemy_corruption - 2
    $player_corruption = $player_corruption - 2    
    $recovery = $recovery + 1

    print ">> You've successfully undid some of your own corruption: #{$player_corruption}"
    puts ">> #{$current_monster_name} failed recovered from corruption: #{$enemy_corruption}"
  elsif @player_success == @monster_success # Stalemate condition
    print ">> Neither you or #{$current_monster_name} successfully recovered any firmware."
  elsif @player_success == "sketchy"
    $enemy_corruption = $enemy_corruption + 1
    $player_corruption = $player_corruption - 1

    print ">> Your recovered attempt of the monster was somewhat successful: #{$corruption}"    
  elsif @monster_success == "sketchy"
    $enemy_corruption = $enemy_corruption - 1
    $player_corruption = $player_corruption + 1

    print ">> #{$current_monster_name} recovery attempt was somewhat successful: #{$corruption}" 
  else
    puts ">> This is not a valid option."
  end
  
  gets.chomp
end

def abandon_monster
  chances_of_abandonment = {
    "success" => "sketchy",
    "sketchy" => "failure",
    "failure" => "success",
  }

  abandonment_rates = [
    "success", "sketchy", "failure",
  ]

  @player_success  = abandonment_rates.sample
  @monster_success = abandonment_rates.sample

  puts "Monster Actions: #{@monster_success}"
  
  if    chances_of_abandonment[@player_success]  == @monster_success
    $player_corruption = $player_corruption + 2

    puts ">> You've failed to convince #{$current_monster_name} abandon its objective."
  elsif chances_of_abandonment[@monster_success] == @player_success
    puts ">> You've successfully convinced #{$current_monster_name} to abandon its mission, finding new enemy."

    monster_name.five_elements
    monster_name.adjectives

    $current_monster_name = $chosen_element + " " + $chosen_adjective  
  elsif @player_success == @monster_success # Stalemate condition
    print ">> Neither you or #{$current_monster_name} successfully convinced each other to abandon their objective."
  elsif @player_success == "sketchy"
    $enemy_corruption = $enemy_corruption + 1
    $player_charisma  = $player_charisma + 1

    puts ">> #{$current_monster_name} briefly considered abandoning its objective."    
  elsif @monster_success == "sketchy"
    $player_corruption = $player_corruption + 1
    $enemy_charisma    = $enemy_charisma + 1

    puts ">> You briefly considered abandoning objective..."
  else
    puts ">> This is not a valid option."
  end
  
  gets.chomp
end

###########################################################################
#                   Variables Determined At Runtime                       #
###########################################################################
monster_name.five_elements
monster_name.adjectives

$current_monster_name = $chosen_element + " " + $chosen_adjective

$player_corruption = 0
$enemy_corruption  = 0
$player_charisma   = 0
$enemy_charisma    = 0

$risk       = 0 # Risk factor that determines puzzle encryption difficulty.
$corruption = 0 # Monsters deliberately corrupted to prevent data recovery.
$recovered  = 0 # From decrypting its broken archive.

print "What is your name? "; $name = gets.chomp

sleep(1.5)

###########################################################################
#                                Main                                     #
###########################################################################
loop do  
  if $player_corruption > 100
    system("clear")

    puts "You were corrupted and unable to be recovered."

    abort
  else
    if $enemy_corruption > 100
      print "You've corrupted a monster."

      system("ruby sparks_of_contamination.rb")
    end

    puts "Monster: #{$current_monster_name}"
    puts "Nom De Plume: #{$name}"

    puts "Risk Factor: #{$risk} Corrupted Monsters: #{$corruption} Recovered: #{$recovered}"
    puts "Player Charisma: #{$player_charisma} Enemy Charisma: #{$enemy_charisma}"

    puts "[0] Attempt To Corrupt"
    puts "[1] Attempt To Recover"
    puts "[2] Attempt To Abandon"

    print "<< "; action = gets.chomp

    if    action == "Attempt to corrupt"; corruption_routine
    elsif action == "Attempt to recover"; recovery_routine
    elsif action == "Attempt to Abandon"; abandonment_routine
    else
      puts "#{$current_monster_name} >> This is not a valid option"
    end
  end
end

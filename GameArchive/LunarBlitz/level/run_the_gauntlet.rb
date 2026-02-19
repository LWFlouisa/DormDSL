$player_hp      = 10
$healer_cactus  = 10
$gunmetal_boots = 10
$alien_gunmetal =  0

$trap_cactus_placed   = 10
$trap_cactus_obtained = 0
$stranded             = false

$cactus_passed = 0

loop do
  system("clear")
  #####################################################################################
  #                                   Conditions                                      #
  #####################################################################################
  # Checks if you have healer cactus or gunmetal boots. And if out of gunmetal boots  #
  # then allows you to make more gunmetal boots.                                      #
  #####################################################################################
  $next_interval = $gunmetal_boots * 5
  
  puts "Gunmetal Boots: #{$gunmetal_boots} Healer Cactus: #{$healer_cactus}"
  puts "Alien Gunmetal: #{$alien_gunmetal} Cactus Passed: #{$cactus_passed}"
  puts "Cactus Placed: #{$trap_cactus_placed} Cactus Obtained: #{$trap_cactus_obtained}"
  puts "Player HP: #{$player_hp}"
  
  if $cactus_passed > 250
    puts "You managed to find land not covered in poisonous cactus. And found a team of survivors whom also archived JPop albums."
    
    sleep(1.5)
    
    system("ruby solstice.rb")
  else
    puts "You have not yet found civilization..."
  end
  
  if $player_hp < 1
    sleep(1.5)

    system("clear")
    puts "You remained stranded in the poisonous cactus..."
    
    abort
  else
    if $stranded == false
      puts "You crashed your ship into a planet covered with poisonous cactus."
      puts "Escape the desert of corruption sand..."
      
      $stranded = true
    else
      puts "Continue into the poisonous cactus desert..."
    end
  end

  if $healer_cactus < 1
    puts "You're all out of healing cactus. Now you can't heal after walking into traps."
  else
    puts "You have #{$healer_cactus} healing cactus left."
  end

  if $gunmetal_boots < 1
    puts "You're all out of gunmetal boot blocks. Now you can't escape without crafting more."
  elsif $gunmetal_boots > $next_interval
    $healing_cactus = $healing_cactus + 1
  else
    puts "You have #{$gunmetal_boots} gunmetal boots left."
  end

  print "Would you like to make some gunmetal boots? << "; query = gets.chomp

  if query == "make boots"
    print "Do you have alien gunmetal? <<"; query2 = gets.chomp

    if query2 == "Yes"
      $alien_gunmetal       = $alien_gunmetal - 1
      $trap_cactus_obtained = $trap_cactus_obtained - 1
      $gunmetal_boots       = $gunmetal_boots + 1

      puts "You've obtained one block of gunmetal boots."
    else
      puts "Try again when you have alien gunmetal."
    end
  elsif query2 == "place healing cactus"
    print "Do you have healing cactus?"; query2 = gets.chomp
    
    if $healer_cactus > 1
      puts "You placed down a block of healing cactus."
    
      $player_hp = $player_hp + 1
      
      $healing_cactus = $healing_cactus - 1
    else
      puts "You're out of healing cactus."
    end
  else
    puts "Be careful not to run out of gunmetal boots."
  end

  #####################################################################################
  #                                 Tile State                                        #
  #####################################################################################
  # The exact tile you walk on is iterate ( you walk through each possible state ).   #
  # If your tile and the computer's tile it thinks your on matches, you die.          #
  #                                                                                   #
  # Otherwise if the game bases whether it heals or damages you based on what your    #
  # current tile is.                                                                  #
  #####################################################################################
  tile_state = {
    "heal"    => "nuetral",
    "nuetral" =>  "damage",
    "damage"  =>    "heal",
  }

  tile_possibilities = [
    [["heal",    "heal"], ["heal",    "nuetral"], ["heal",    "damage"]],
    [["nuetral", "heal"], ["nuetral", "nuetral"], ["nuetral", "damage"]],
    [["damage",  "heal"], ["damage",  "nuetral"], ["damage",  "damage"]],
  ]

  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1]

  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample

  enemy_tile = tile_possibilities[cur_row][cur_col][cur_arr]

  player_tiles = [
    "heal", 
    "nuetral", 
    "damage"
  ]

  tile_index          = 0
  current_player_tile = player_tiles[tile_index]

  if current_player_tile == enemy_tile
    $player_hp = $player_hp - 1

    puts "You were damaged by a trap. You have #{$player_hp} hp left."
  else
    if    current_player_tile ==    "heal"; $player_hp = $player_hp + 1
    elsif current_player_tile == "nuetral"; puts "You managed to traverse the corrupted desert."
    elsif current_player_tile ==  "damage"; $player_hp = $player_hp - 1
    else
      puts "Unrecognized result..."
    end
  end
end

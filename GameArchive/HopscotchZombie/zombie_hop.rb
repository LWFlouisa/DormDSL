$limbs_lost = 0
$calculate_steps = 0

## Temporary game over sequence.
def hangman
  system("clear; ruby player_guillotine.rb")
end

def hop_tiles
  def process_two_steps
    if    $calculate_steps == 3
      puts "    [   ]    "
      puts "    [   ]    "
      puts "    [   ]    "
      puts "  [ @] [@ ]  "
      puts "    [   ]    "
      puts "  [  ] [  ]  "
      puts "    [   ]    "
      puts "  [       ]  "

      conditions = [ "in square", "out square" ]

      current_condition == conditions.sample

      if    current_condition == "in square"
        $calculate_steps = $calculate_steps + 1
      elsif current_condition == "out square"
        lose turn
      end
    elsif $calculate_steps == 6
      puts "    [   ]    "
      puts "    [   ]    "
      puts "    [   ]    "
      puts "  [  ] [  ]  "
      puts "    [   ]    "
      puts "  [ @] [@ ]  "
      puts "    [   ]    "
      puts "  [       ]  "

      conditions = [ "in square", "out square" ]

      current_condition == conditions.sample

      if    current_condition == "in square"
        $calculate_steps = $calculate_steps + 1
      elsif current_condition == "out square"
        lose turn
      end
    elsif $calculate_steps == 9
      puts "    [   ]    "
      puts "    [   ]    "
      puts "    [   ]    "
      puts "  [  ] [  ]  "
      puts "    [   ]    "
      puts "  [  ] [  ]  "
      puts "    [   ]    "
      puts "  [ @   @ ]  "

      conditions = [ "in square", "out square" ]

      current_condition == conditions.sample

      if    current_condition == "in square"
        $calculate_steps = $calculate_steps + 1
      elsif current_condition == "out square"
        lose turn
      end
    end
  end

  $calculate_steps = 0

  loop do
    if $calculate_steps == 0
      puts "    [ @ ]    "
      puts "    [   ]    "
      puts "    [   ]    "
      puts "  [  ] [  ]  "
      puts "    [   ]    "
      puts "  [  ] [  ]  "
      puts "    [   ]    "
      puts "  [       ]  "

      conditions = [ "in square", "out square" ]

      current_condition == conditions.sample

      if    current_condition == "in square"
        $calculate_steps = $calculate_steps + 1
      elsif current_condition == "out square"
        lose turn
      end
    elsif $calculate_steps == 1
      puts "    [   ]    "
      puts "    [ @ ]    "
      puts "    [   ]    "
      puts "  [  ] [  ]  "
      puts "    [   ]    "
      puts "  [  ] [  ]  "
      puts "    [   ]    "
      puts "  [       ]  "

      conditions = [ "in square", "out square" ]

      current_condition == conditions.sample

      if    current_condition == "in square"
        $calculate_steps = $calculate_steps + 1
      elsif current_condition == "out square"
        lose turn
      end
    elsif $calculate_ste=s == 2
      puts "    [   ]    "
      puts "    [   ]    "
      puts "    [ @ ]    "
      puts "  [  ] [  ]  "
      puts "    [   ]    "
      puts "  [  ] [  ]  "
      puts "    [   ]    "
      puts "  [       ]  "

      conditions = [ "in square", "out square" ]

      current_condition == conditions.sample

      if    current_condition == "in square"
        $calculate_steps = $calculate_steps + 2
      elsif current_condition == "out square"
        lose turn
      end
    elsif $calculate_steps == 5
      puts "    [   ]    "
      puts "    [   ]    "
      puts "    [   ]    "
      puts "  [  ] [  ]  "
      puts "    [ @ ]    "
      puts "  [  ] [  ]  "
      puts "    [   ]    "
      puts "  [       ]  "

      conditions = [ "in square", "out square" ]

      current_condition == conditions.sample

      if    current_condition == "in square"
        $calculate_steps = $calculate_steps + 1
      elsif current_condition == "out square"
        lose turn
      end
    elsif $calculate_steps == 8
      puts "    [   ]    "
      puts "    [   ]    "
      puts "    [   ]    "
      puts "  [  ] [  ]  "
      puts "    [   ]    "
      puts "  [  ] [  ]  "
      puts "    [ @ ]    "
      puts "  [       ]  "

      conditions = [ "in square", "out square" ]

      current_condition == conditions.sample

      if    current_condition == "in square"
        $calculate_steps = $calculate_steps + 1
      elsif current_condition == "out square"
        lose turn
      end
    else
      process_two_steps
    end

    calculate_steps = calculate_steps + 1

    sleep(1.5)

    system("clear")
  end
end

def lose_turn
  if $limbs_lost > 5
    puts ">> You crumbled into dust..."

    hangman
  end

  puts ">> Lost lost one of your limbs..."

  sleep(1.5)

  $limbs_lost = $limbs_lost + 1
end

$player_has_stone = true

possible_landing_zones = [
  "left-side",
  "inside-square",
  "right-side"
]

if $player_has_stone == true
  print "Do you wish to toss the stone? << "; toss_stone = gets.chomp

  if    toss_stone == "toss"
    $player_has_stone = false

    current_landing_spot = possible_landing_zones.sample

    if current_landing_spot == "left-side"
      lose_turn
    elsif current_landing_spot == "right-side"
      lose_turn
    elsif current_landing_spot == "inside-square"
      hop_tiles
    else
      puts ">> Command not understood."
    end
  else
    puts ">> You have to toss the stone to play hopscotch."

    lose_turn
  end
else
  lose_turn
end

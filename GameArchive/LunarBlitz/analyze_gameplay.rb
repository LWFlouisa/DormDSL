require "devtools/yumekusari.rb"

puts "JPop Album Archical"
yumekusari("[ Archive ] This predicts whether the player will stab the enemy.",
           "[ Timeout ] This predicts whether the player will run out of days and hours to archive JPop CDs.",
           "[ Death ] This predicts how likely the player will die from their injuries.",
           
           12, 12)

#thresholding($current_probability, 12, 12)

puts "Combat Mechanics"
yumekusari("[ Shoot ] This predicts whether the player will shoot the enemy.",
           "[ Steal ] This predicts whether the player will steal from the enemy.",
           "[ Stab ] This predicts whether the player will stab the enemy.",
           
           12, 12)

#thresholding($current_probability, 12, 12)
           
puts "Ship Logistics"
yumekusari("[ Attack ] This allows you to defeat enemy ships normally.",
           "[ Repair Ship ] Repair your space cruiser when supplies get low.",
           "[ Kamikaze ] Self destruct your ship and wait for rescue.",
           
           12, 12)

#thresholding($current_probability, 12, 12)
           
puts "Stranded Logistics"
yumekusari("[ Make Boots ] Allows the player to make a walkpath out of alien gunmetal.",
           "[ Healing Cactus ] Healing cactus heals the player.",
           "[ Alien Gunmetal ] Collect alien gunmetal to make walkpaths.",
           
           12, 12)
           
#thresholding($current_probability, 12, 12)

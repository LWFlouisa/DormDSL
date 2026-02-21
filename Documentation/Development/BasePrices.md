## Base Prices
Right now the pre-trained model that a live model is compared to prices commodities at: ( This technically makes it darker than Star Trek )

~~~ruby
yen     = 198         #     198
dirt    = 1 / yen

franc   = yen * 100   #  19,800
lunario = yen * 1009  # 198,000

item_prices = [
  [ :yen,   "Suvorexant",         0.000035963 ], # yen for price of    0.007120674
  [ :yen,      "Potions",         0.002582936 ], # yen for price of   51.142132800
  [ :yen,     "Antidote", 0.21780000000000002 ], # yen for price of 909.090909091 franc
], [
  [ :franc, "Copper Sword",         0.000001668 ], # franc for price of 0.0330264 or 6.5392272 yen.
  [ :franc, "Bronze Sword",         0.000122526 ], # franc for price of 2.4260148 or 480.3509304 yen.
  [ :franc,   "Iron Sword",         0.000213490 ], # franc for price of 4.227102 franc or 836.966196 yen.
], [
  [ :lunario, "Spaceship Francophone",          0.01185921 ], # lunario for price of 234.812358 or 4649285 Franc
  [ :lunario,    "Spaceship Japanese", 0.87120000000000010 ], # lunario for price of 1724976 or 34154524800 Franc
  [ :lunario,      "Mystic Spaceship", 0.10890000000000001 ], # lunario for price of 43.1244 or 1078110 Franc
]

price_of_potion     = item_prices[0][0][2]
price_of_sleep_aids = item_prices[0][1][2]
price_of_antidote   = item_prices[0][2][2]

price_of_cp_sword = item_prices[1][0][2]
price_of_bz_sword = item_prices[1][1][2]
price_of_ir_sword = item_prices[1][2][2]

price_of_fr_ship = lunario * item_prices[2][0][2]
price_of_jp_ship = lunario * item_prices[2][1][2]
price_of_my_ship = lunario * item_prices[2][2][2]

puts "BASE AMMENTITY PRICES"
puts "The price of a Potion is: #{(price_of_potion * yen) * dirt} dirt"
puts "The price of a Suvorexant is: #{(price_of_sleep_aids * yen) * dirt} dirt"
puts "The price of a Antidote is: #{(price_of_antidote * yen)} yen"

puts "BASE WEAPON PRICES"
puts "The price of a Copper Sword is: #{(price_of_cp_sword * franc)} franc or #{(price_of_cp_sword * franc) * yen} yen"
puts "The price of a Bronze Sword is: #{(price_of_bz_sword * franc)} franc or #{(price_of_bz_sword * franc) * yen} yen"
puts "The price of a Iron Sword is: #{(price_of_ir_sword * franc)} franc or #{(price_of_ir_sword * franc) * yen} yen"

puts "BASE SHIP PRICES"
puts "The price of a French starship is: #{price_of_fr_ship.round} in Lunario or #{(price_of_fr_ship * franc).round} franc or #{(price_of_fr_ship * yen).round} yen"
puts "The price of a Japanese starship is: #{price_of_jp_ship.round} in Lunario or #{(price_of_jp_ship * franc).round} franc or #{(price_of_jp_ship * yen).round} yen"
~~~

# Emergent Post War Economies
Guard Robots in prison territories became vastly more expensive than supercomputers or mining rigs just to harvest the raw materials to make them.

This is the pre-trained model, and will compare it to a live model later on.

~~~ruby
## Territories surviving French and Japanese colonialism
hybrid_territories = [ ## Food seems to be below the value of a yen.
  [ :yen,     "Green Peas", 0.000140641 ], # yen for price of 0.027846918
  [ :yen,   "Tofu Protein", 0.000140641 ], # yen for price of 0.027846918
  [ :yen, "Prison Uniform", 0.000015316 ], # yen for price of 3.032568000
], [ ## Black market goods cost as much as Prison Warden's yearly salary.
  [ :franc,   "Black Market Goods", 0.011859210000000002 ], # franc for price of 86.24880000
  [ :franc, "Prison Warden Salary", 0.000140641000000000 ], # franc for price of 86.24880000
], [ ## Cheaper to buy a super computer than a Guard Robot
  [ :lunario,  "Guard Robots", 0.001291468 ], # Lunario for price of 2348.12358 Lunario
  [ :lunario, "Supercomputer", 0.082653950 ], # Lunario for price of 18.78498864 Lunario.
  [ :lunario,   "Mining Rigs", 0.047436840 ], # Lunario for price of 21.5622 Lunario
]
~~~

## Death Of Green Peas ( Final Revolutionary Era )
Green Peas as a food stuff almost dissappeared, while cartons of milk remerged. A personal pet robot is equivlent to a block of tofu. Infrastructure is priced in francs, while government ships are priced in Lunario.

~~~ruby
final_revolutionary_era = [
  [ :yen,        "Tofu Protein",         0.036004061 ], # yen for price of 7.128804078 yen
  [ :yen,      "Carton Of Milk", 0.00129146800000000 ], # yen for price of 0.255710664 yen
  [ :yen, "Personal Pet Robots",          0.00007032 ], # yen for 7.032 yen
], [
  [ :franc,   "Standard Cat Pets", 0.10890000000000001 ], # franc for price of 2.34812358
  [ :franc, "Anos Seyanetegaragu - [ Derived from Chantie De Gareji ] A squatted territory that combines midwestern adobe, minimalist circular interiors, and external garages for technical workshops, research and development, and art galleries. Some are complex enough to connect to underground lakes and rivers. Used to be priced in Lunario.", 0.000030632 ], # yen for price of 606.5136 yen or 64.638286812 franc.
], [

  [ :lunario, "Red ships are easier to survive cold storms than hot storms.", 0.43560000000000004 ], # lunario for price of 172.4976
]
~~~

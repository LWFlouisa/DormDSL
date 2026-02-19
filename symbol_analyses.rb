2.times do
  get_statistics(:parked_car,     a,
                 :visited_friend, b,
                 :wendigo_poodle, c)

  dynamic_reward_allocation

  thresholding($current_probability, 12, 12)

  dream_symbols = sore_float($current_probability > 0.8) do
    puts "\n#{$current_definition} is highly developed"

    puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
  end

  dream_symbols = shikashi_float(dream_symbols, $current_probability < 0.2) do
    puts "\n#{$current_definition} is marginally developed"

    puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
  end

  dream_symbols = matawa_float(dream_symbols) do
    puts "\n#{$current_definition} is somewhat developed"

    puts mperiod_sprox(proximity_de_nemedusahoseki(150, $current_probability), proximity_de_memorie($current_probability))
  end
end

def yumekusari(a, b, c, map_y, map_x)
  require "NeoPathfinding"

  markov_one = Gabbler.new
  markov_two = Gabbler.new
  markov_tre = Gabbler.new
  
  markov_one.learn(a)
  markov_two.learn(b)
  markov_tre.learn(c)
  
  d = markov_one.sentence
  e = markov_two.sentence
  f = markov_tre.sentence
  
  2.times do
    get_statistics(:markov_one, a,
                   :markov_two, b,
                   :markov_tre, c)
                 
                   dynamic_reward_allocation
                   #thresholding($current_probability, map_y, map_x)
  end
end

def yumekusari_f(d, e, f)
  require "NeoPathfinding"

  markov1 = Gabbler.new
  markov2 = Gabbler.new
  markov3 = Gabbler.new

  a = d # cette("pomme", "rouge")
  b = e # maisette("pomme", "vert")
  c = f # sinon("pomme", "rouge", "vert", "sinon")

  ouvert("data/cette/cette_results.txt",       a,
         "data/maisette/maisette_results.txt", b,
         "data/sinon/sinon_results.txt",       c)
       
  results_de_cette    = File.read("data/cette/cette_results.txt")
  results_de_maisette = File.read("data/maisette/maisette_results.txt")
  results_de_sinon    = File.read("data/sinon/sinon_results.txt")

  markov1.learn(results_de_cette)
  markov2.learn(results_de_maisette)
  markov3.learn(results_de_sinon)

  g = markov1.sentence
  h = markov2.sentence
  i = markov3.sentence

  2.times do
    get_statistics(:markov_one, g,
                   :markov_two, h,
                   :markov_tre, i)
                 
                   dynamic_reward_allocation
                   thresholding($current_probability, 12, 12)
  end
end

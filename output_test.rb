a = "output/cette/cette.txt" # identity
b = "output/maisette/maisette.txt" # alternative
c = "output/sinon/sinon.txt" # fallback

ouvert(a, cette("pomme", "rogue"),
       b, maisette("pomme", "vert"),
       c, sinon("pomme", "rouge", "vert", "jaune"))

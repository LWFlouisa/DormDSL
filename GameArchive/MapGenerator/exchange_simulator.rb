def simulute_exchang(a1, a2, b1, b2, c1, c2,
                     d1, d2, e1, e1, f1, f2,
                     g1, g2, h1, h2, i1, i2)
    
  a = a1, a2
  b = b1, b2
  c = c1, c2
  d = d1, d2
  e = e1, e2
  f = f1, f2
  g = g1, g2
  h = h1, h2
  i = i1, i2
                 
  yen     = 198
  franc   = 100 * ( yen * 0.01 )
  lunario = 1000 * ( yen * 0.001 )
  
  yen_items = [
    [[a[8], a[0], a[0]], [[a[8], a[0], b[0]], [[a[8], a[0], c[0]]],
    [[b[8], b[0], a[0]], [[b[8], b[0], b[0]], [[b[8], b[0], c[0]]],
    [[c[8], c[0], a[0]], [[c[8], c[0], b[0]], [[c[8], c[0], c[0]]],
  ], [
    [[a[1], a[1], a[1]], [[a[1], a[1], b[1]], [[a[1], a[1], c[1]]],
    [[b[1], b[1], a[1]], [[b[1], b[1], b[1]], [[b[1], b[1], c[1]]],
    [[c[1], c[1], a[1]], [[c[1], c[1], b[1]], [[c[1], c[1], c[1]]],
  ], [
    [[0.33, 0.33, 0.33], [0.33, 0.33, 0.33], [0.33, 0.33, 0.33]],
    [[0.33, 0.33, 0.33], [0.33, 0.33, 0.33], [0.33, 0.33, 0.33]],
    [[0.33, 0.33, 0.33], [0.33, 0.33, 0.33], [0.33, 0.33, 0.33]],
  ]
  
  franc_items = [
    [[d[8], d[0], d[0]], [[d[8], d[0], e[0]], [[d[8], d[0], f[0]]],
    [[e[8], e[0], d[0]], [[e[8], e[0], e[0]], [[e[8], e[0], f[0]]],
    [[f[8], f[0], d[0]], [[f[8], f[0], e[0]], [[f[8], f[0], f[0]]],
  ], [
    [[d[1], d[1], d[1]], [[d[1], d[1], e[1]], [[d[1], d[1], f[1]]],
    [[e[1], e[1], d[1]], [[e[1], e[1], e[1]], [[e[1], e[1], f[1]]],
    [[f[1], f[1], d[1]], [[f[1], f[1], e[1]], [[f[1], f[1], f[1]]],
  ], [
    [[0.33, 0.33, 0.33], [0.33, 0.33, 0.33], [0.33, 0.33, 0.33]],
    [[0.33, 0.33, 0.33], [0.33, 0.33, 0.33], [0.33, 0.33, 0.33]],
    [[0.33, 0.33, 0.33], [0.33, 0.33, 0.33], [0.33, 0.33, 0.33]],
  ]
  
  lunario_services = [
    [[g[8], g[0], g[0]], [[g[8], g[0], h[0]], [[g[8], g[0], i[0]]],
    [[h[8], h[0], g[0]], [[h[8], h[0], h[0]], [[h[8], h[0], i[0]]],
    [[i[8], i[0], g[0]], [[i[8], i[0], h[0]], [[i[8], i[0], i[0]]], 
  ], [
    [[g[1], g[1], g[1]], [[g[1], g[0], h[0]], [[g[8], g[0], i[0]]],
    [[h[1], h[1], g[1]], [[h[1], h[0], h[0]], [[h[8], h[0], i[0]]],
    [[i[1], i[1], g[1]], [[i[1], i[0], h[0]], [[i[8], i[0], i[0]]], 
  ], [
    [[0.33, 0.33, 0.33], [0.33, 0.33, 0.33], [0.33, 0.33, 0.33]],
    [[0.33, 0.33, 0.33], [0.33, 0.33, 0.33], [0.33, 0.33, 0.33]],
    [[0.33, 0.33, 0.33], [0.33, 0.33, 0.33], [0.33, 0.33, 0.33]],
  ]
  
  yen_symbol      = yen_items[0]
  yen_description = yen_items[1]

  franc_symbol      = franc_items[0]
  franc_description = franc_items[1]

  lunario_symbol      = lunario_services[0]
  lunario_description = lunario_services[1]

  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1, 2]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  current_yen_symbol      = yen_symbol[cur_row][cur_col][cur_arr]
  current_yen_description = yen_description[cur_row][cur_col][cur_arr]

  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1, 2]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  current_franc_symbol      = franc_symbol[cur_row][cur_col][cur_arr]
  current_franc_description = franc_description[cur_row][cur_col][cur_arr]

  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1, 2]
  
  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  current_lunario_symbol      = lunario_symbol[cur_row][cur_col][cur_arr]
  current_lunario_description = lunario_description[cur_row][cur_col][cur_arr]
  
  2.times do
    get_statistics(current_yen_symbol,     current_yen_description,
                   current_franc_symbol,   current_franc_description,
                   current_lunario_symbol, current_lunario_description)
                   
                   dynamic_mode_switcher
  end
end

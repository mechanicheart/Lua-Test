function Calc_Card()
  tbl = {};
  
  dist = 0.00;
  p_tbl = 1;
  while(dist <= 5.20) do
    dist = dist + 1.00 / (p_tbl + 1);
    table.insert(tbl , p_tbl , dist);
    p_tbl = p_tbl + 1;
  end
  
  return tbl;
end

function find(tbl , val)                                --binary search is also sugguested
  for k , v in ipairs(tbl) do
    if(v >= val) then
      return k;
    end
  end

end

card_tbl = Calc_Card();
while(1) do
  input_val = tonumber(io.read());
  if(input_val == 0.00) then
    break;
  end;
  print(find(card_tbl , input_val) .. " card(s)");
end;
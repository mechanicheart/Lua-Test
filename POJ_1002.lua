--Compiled with ZeroBrane Studio
function Key_Mapper(chr)
    if(chr == 'A' or chr == 'B' or chr == 'C') then
      return 2;
    elseif(chr == 'D' or chr == 'E' or chr == 'F') then
      return 3;
    elseif(chr == 'G' or chr == 'H' or chr == 'I') then
      return 4;
    elseif(chr == 'J' or chr == 'K' or chr == 'L') then
      return 5;
    elseif(chr == 'M' or chr == 'N' or chr == 'O') then
      return 6;
    elseif(chr == 'P' or chr == 'R' or chr == 'S') then
      return 7;
    elseif(chr == 'T' or chr == 'U' or chr == 'V') then
      return 8;
    elseif(chr == 'W' or chr == 'X' or chr == 'Y') then
      return 9;
    else
      return chr;
    end
end

--[[function calc_sum(str)
  sum = 0;
  for c in string.gmatch(str , '%w') do 
    sum = sum * 10 + c - '0';
  end
  return sum;
end]]--

kase = io.read();
tbl = {};
str_tbl = {};
num_tbl = {};                                 --what if we had structures......

copy_str = 1;
for k = 1 , kase do
  str = io.read();
  blk_str = "";

  i = 1;
  chk_sum = 0;
  for c in string.gmatch(str , '%w') do
    c = Key_Mapper(c);
    chk_sum = chk_sum * 10 + c - '0';
    if(i == 4) then
      blk_str = blk_str.. '-';
    end
    blk_str = blk_str .. c;
    i = i + 1; 
  end

  num_tbl[blk_str] = chk_sum;
  if(type(tbl[chk_sum]) == type(nil)) then
    tbl[chk_sum] = 1;
    str_tbl[copy_str] = blk_str;
    copy_str = copy_str + 1;
  else
    tbl[chk_sum] = tbl[chk_sum] + 1;
  end
  --print(blk_str);
end

table.sort(str_tbl);                          --output in ascending lexicographical order
for k , v in ipairs(str_tbl) do
  if(tbl[num_tbl[v]] ~= 1) then
    print(v .. " " .. tbl[num_tbl[v]]);
  end
end

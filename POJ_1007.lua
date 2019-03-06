--sortness?

function dna_Calc(str , n)
  str = string.reverse(str);
  
  cur_A = 0;
  cur_C = 0;
  cur_G = 0;
  sort_sum = 0;
  for i = 1 , n do
    
    if(string.byte(str , i) == 84) then
      sort_sum = sort_sum + cur_A + cur_C + cur_G;
      
    elseif(string.byte(str , i) == 71) then
      sort_sum = sort_sum + cur_A + cur_C;
      cur_G = cur_G + 1;
      
    elseif(string.byte(str , i) == 67) then
      sort_sum = sort_sum + cur_A;
      cur_C = cur_C + 1;
      
    else
      cur_A = cur_A + 1;
      
    end
  end
  
  return sort_sum;
end

input_str = io.read();
input_tbl = {};

for i in string.gmatch(input_str , '%d+') do
  table.insert(input_tbl , tonumber(i));
end

n = input_tbl[1];
m = input_tbl[2];

num_tbl = {};
str_tbl = {};

for i = 1 , m do
  cur_str = io.read();
  sort_t = dna_Calc(cur_str , n);
  str_tbl[sort_t] = cur_str;
  table.insert(num_tbl , sort_t);
end

table.sort(num_tbl);
for i = 1 , m do
  print(str_tbl[num_tbl[i]]);
end

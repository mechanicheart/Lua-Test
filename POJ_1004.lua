--high-precision plus algorithm needed in C/C++, but not lua
sum = 0;
for i = 1 , 12 do
  sum = sum + tonumber(io.read());
end
  
print(string.format("$%.2f" , sum / 12));
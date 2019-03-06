--Maya Calendar

function HaabMonth_Define()
  month_tbl = {};

  --no enum......
  --pop, no, zip, zotz, tzec, xul, yoxkin, mol, chen, yax, zac, ceh, mac, kankin, muan, pax, koyab, cumhu
  month_tbl["pop"] = 1;
  month_tbl["no"] = 2;
  month_tbl["zip"] = 3;
  month_tbl["zotc"] = 4;
  month_tbl["tzec"] = 5;
  month_tbl["xul"] = 6;
  month_tbl["yoxkin"] = 7;
  month_tbl["mol"] = 8;
  month_tbl["chen"] = 9;
  month_tbl["yax"] = 10;
  month_tbl["zac"] = 11;
  month_tbl["ceh"] = 12;
  month_tbl["mac"] = 13;
  month_tbl["kankin"] = 14;
  month_tbl["muan"] = 15;
  month_tbl["pax"] = 16;
  month_tbl["koyab"] = 17;
  month_tbl["cumhu"] = 18;
  month_tbl["uayet"] = 19;

  return month_tbl;
end
  
function TzolkinDay_Define()
  day_tbl = {};
  
  --imix, ik, akbal, kan, chicchan, cimi, manik, lamat, muluk, ok, chuen, eb, ben, ix, mem, cib, caban, eznab, canac, ahau
  day_tbl[1] = "imix";
  day_tbl[2] = "ik";
  day_tbl[3] = "akbal";
  day_tbl[4] = "kan";
  day_tbl[5] = "chicchan";
  day_tbl[6] = "cimi";
  day_tbl[7] = "manik";
  day_tbl[8] = "lamat";
  day_tbl[9] = "muluk";
  day_tbl[10] = "ok";
  day_tbl[11] = "chuen";
  day_tbl[12] = "eb";
  day_tbl[13] = "ben";
  day_tbl[14] = "ix";
  day_tbl[15] = "men";
  day_tbl[16] = "cib";
  day_tbl[17] = "caban";
  day_tbl[18] = "eznab";
  day_tbl[19] = "canac";
  day_tbl[20] = "ahau";

  return day_tbl;
end

function Format_Extract(str)
  time_tbl = {};                      --index 1 denotes day, 2 denotes month, 3 denotes year
  
  j = 0;
  for i in string.gmatch(str , '%d+') do
    table.insert(time_tbl , 2 * j + 1 , tonumber(i));
    j = j + 1;
  end
  
  table.insert(time_tbl , 2 , string.match(str , '%a+'));
  return time_tbl;
end

kase = io.read();
print(kase);

Haab_tbl = {};
Haabmonth_tbl = HaabMonth_Define();
TzolkinDay_tbl = TzolkinDay_Define();

for i = 1 , kase do
  Haab_tbl = Format_Extract(io.read());
  day_t = Haab_tbl[1];
  month_t = Haabmonth_tbl[Haab_tbl[2]];
  year_t = Haab_tbl[3];
  sum_t = year_t * 365 + (month_t - 1) * 20 + day_t;
  
  year_d = math.floor(sum_t / 260);
  rest_d = sum_t % 260; 
  period_d = rest_d % 13 + 1;
  day_d = rest_d % 20 + 1;
  
  print(period_d .. " " .. TzolkinDay_tbl[day_d] .. " " .. year_d);
  
  --print(day_t , month_t , year_t);
end
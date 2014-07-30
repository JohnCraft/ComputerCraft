local mon = peripheral.wrap("back")
term.redirect(mon)
os.loadAPI("json")
term.clear()
term.setCursorPos(3,1)
Incr = 0

while true do

  local contenu = http.get("http://goofyplace.org/Black/twitter/request.php?user=FeedThePatrick")
  local contenu = http.get("http://goofyplace.org/Black/twitter/request.php?user=FeedTheTrouduc")
  local data = contenu.readAll()
  
  decode = json.decode(data)
  i = 10
  
    while i <= 10 do
      if decode.statuses[i] ~= null then
  	     local text = decode.statuses[i].text
  	     text = text:gsub("u00e9","e") 
  	     text = text:gsub("u00e0","a") 
  	     text = text:gsub("u00a0"," ")
        local from = decode.statuses[i].user.name
        local long = string.len(from)
        local I = 74 - long
        
      if Incr==0 then
        color = colors.white
      elseif Incr == 1 then
        color = colors.orange
      elseif Incr == 2 then
        color = colors.magenta
      elseif Incr == 3 then
        color = colors.yellow
      elseif Incr == 4 then
        color = colors.lime
      elseif Incr == 5 then
        color = colors.pink
      elseif Incr == 6 then
        color = colors.gray
      elseif Incr == 7 then
        color = colors.cyan
      elseif Incr == 8 then
        color = colors.purple
      elseif Incr == 9 then
        color = colors.blue
      elseif Incr == 10 then
        color  = colors.brown
      elseif Incr == 11 then
        color = colors.green
      else
        Incr = 0
      end


	Incr = Incr + 1
	term.setTextColor(color)
      	print("----------------------------------------------------------------------------------")
        print(" "..text)
        write("\n from : " ..from)
	print("----------------------------------------------------------------------------------")
        while I > 0 do
         	I = I - 1
        end
      end

    i = i - 1
    sleep(0.1)
    end

    sleep(0.3)
end

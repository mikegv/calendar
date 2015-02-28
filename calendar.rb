#
#small program to copy all the events off the site and place them in a text file
#

require 'mechanize'    						# library for parsing sites


agent = Mechanize.new 
results = File.open("results.txt", "w")     

page = agent.get("http://www.fulton55.com")  	# store the website in 'page' for parsing

#counter = 10  		#starting point for grabbing events. skip the first few generic links
#max = 108  			#stop before the last few generic links

#events = page.links   	#store all the links from the page in an array
page.links.each do |link|
	results.puts link
end
	
/*
infoArray = Array.new
event = events[counter].click 
counter += 1
while (counter < max) do										#iterate through the links grabbing only relevant ones
  event = events[counter]								# not links to ticketmaster
  if event.text != "Tickets" and event.text != "More Info"
	if event.text != events[counter-1].text  
		infoArray[counter] = event.text
		puts event
	end
   end
  
 counter += 1			#increment 
end
*/
results.close          #close the file for good measure
  

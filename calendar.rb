#
#small program to copy all the events off the site and place them in a text file
#

require 'mechanize'    						# library for parsing sites


agent = Mechanize.new 
results = File.open("results.txt", "w")     

page = agent.get("http://www.fulton55.com")  	# store the website in 'page' for parsing

counter = 10  		#starting point for grabbing events. skip the first few generic links
max = 108  			#stop before the last few generic links

events = page.links   	#store all the links from the page in an array
  
while (counter < max) do										#iterate through the links grabbing only relevant ones
  event = events[counter] 										# not links to ticketmaster
  if event.text != "Tickets" and event.text != "More Info"   
    info = event.click.title									#clicks on every event link and returns the info 
	puts info
	results << info												#and store it in results txt file
  end
   
  counter += 2			#increment by 2 because each event has  like 2 links, sometimes 3.
end

results.close          #close the file for good measure
  

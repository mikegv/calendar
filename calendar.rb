#
#small program to copy all the events off the site and place them in a text file
#

require 'mechanize'    						# library for parsing sites


agent = Mechanize.new 
results = File.open("results.txt", "w")     

page = agent.get("http://www.fulton55.com")  	# store the website in 'page' for parsing

uri = Array.new
i = 0
page.links.each do |link| 
	if link.uri.to_s.include?("event")
		unless link.uri.to_s.include?("ticketfly")
			uri[i] = link.click.title
			i = i + 1
		end
	end	
end

puts "base URL #{page.uri}"

slimmed = Array.new
i=0
j=0
while (i < uri.length)
	if uri[i] != uri[i-1]
		slimmed[j] = uri[i]
		j = j + 1
	end
	i = i + 1
end
results.puts uri
puts slimmed
slimmed.each do |event|
	item = event.split("\u2013")
	puts item
end


results.close          #close the file for good measure
  

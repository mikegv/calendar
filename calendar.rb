#
#small program to copy all the events off the site and place them in a text file
#

require 'mechanize'    						# library for parsing sites

def get_events(uri, page)  
	page.links.each do |link| 			#save relevant events w/ date by clicking on and saving them
		if link.uri.to_s.include?("event")	
			unless link.uri.to_s.include?("ticketfly")
				uri.push(link.click.title)
			end
		end	
	end
end

def slim(slimmed, uri)
	i=0
	j=0
	while (i < uri.length)			#loops through all the results and gets rid
		if uri[i] != uri[i-1]		# of repetative results
			slimmed[j] = uri[i]
			j = j + 1
		end
		i = i + 1
	end
end

def storeEvents(slimmed)
	uri = Hash.new
	#format the date... yeah, thats right...
	#uses split to break eacch event up at a '-' dash. (which is \u2013"
	slimmed.each do |event|		
		event, ticket, place, town, date = event.split("\u2013")
		event = event.gsub(/Fulton 55 .. /,"").lstrip  #regular expressions out the 'fulton55 >>' part
		uri[event] = date.lstrip.rstrip
	end
	return uri
end



agent = Mechanize.new 
results = File.open("results.txt", "w")     

page = agent.get("http://www.fulton55.com")  	# store the website in 'page' for parsing

uri = Array.new


get_events(uri, page)		#calls function




puts "base URL #{page.uri}"  #just prints the base url which is "fulton55.com"

slimmed = Array.new

slim(slimmed, uri)			#calls function





results.puts storeEvents(slimmed)			#calls function saves all the events after that into results file

results.close          #close the file for good measure





module Mech
	require 'mechanize'    						# library for parsing sites


	agent = Mechanize.new 
	results = File.open("results.txt", "w")     

	page = agent.get("http://www.fulton55.com")  	# store the website in 'page' for parsing

end
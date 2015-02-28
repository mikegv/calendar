
require 'selenium-webdriver'
require 'mechanize'

driver = Selenium::WebDriver.for :chrome
source = File.open("source.txt", "w")     

driver.get "http://www.fullcirclebrewing.com"
source.puts driver.page_source

source.close

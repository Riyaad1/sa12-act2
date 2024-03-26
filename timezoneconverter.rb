require 'httparty'
require 'json'

response = HTTParty.get('http://worldtimeapi.org/api/timezone/Europe/London')

if response.success?
  extraction = JSON.parse(response.body)
  timezone = extraction['timezone']
  date_time = DateTime.parse(extraction['datetime'])
  puts "The current time in #{timezone} is #{date_time.strftime("%Y-%m-%d %H:%M:%S")}"
end

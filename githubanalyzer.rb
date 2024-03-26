require 'httparty'

response = HTTParty.get('https://api.github.com/users/apple/repos')

if response.success?
  response.sort_by! { |x| -x['stargazers_count']}
  highest = response.first
  name, description, stars, url = highest['name'], highest['description'], highest['stargazers_count'], highest['html_url']
  puts "Name: #{name} | Description: #{description} | Stars: #{stars} | URL: #{url}"
end

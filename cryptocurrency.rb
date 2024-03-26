require 'httparty'
require 'json'

response = HTTParty.get('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd')

if response.success?
  extraction = JSON.parse(response.body)
  extraction.sort_by! { |x| -x['market_cap']}
  crypto_top = extraction.take(5)
  crypto_top.each_with_index do |x, y|
    name, price, market = x['name'], x['current_price'], x['market_cap']
    puts "#{y + 1}. Name: #{name} | Current Price: #{price} | Market Capitalization: #{market}"
  end
end

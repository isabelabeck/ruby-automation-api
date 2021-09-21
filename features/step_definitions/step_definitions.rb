require 'uri'
require 'net/http'
require 'json'

Given('I want to verify a zip code {string}') do |zip_code|
    @uri = URI("https://viacep.com.br/ws/#{zip_code}/json/")     
end

When('I use this API to verify the zip code') do
    @response = Net::HTTP.get_response(@uri)
    if @response.is_a?(Net::HTTPSuccess)
        @json_response = JSON.parse(@response.body) 
        puts @json_response["logradouro"]  
    end
end
  
Then('the address inside the result should be {string}') do |valid_address|
    expect(valid_address).to eq(@json_response["logradouro"])
end

Then('the result should be HTTP error 400') do 
    expect(@response.is_a?(Net::HTTPBadRequest)).to be(true)
end

Then('the result should be error: true') do 
    expect(true).to eq(@json_response["erro"])
end

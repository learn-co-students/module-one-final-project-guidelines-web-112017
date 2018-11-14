class Residence < ActiveRecord::Base
  belongs_to :user
  belongs_to :polling_place

  def get_council_district
    #uses self.address to get district
    #queries API for election district of residenceinstance.address and returns it
    query_string = "https://nyc.electionapi.com/psl/pollsiteinfo?"
    street_number = "streetnumber=#{self.street_number}"
    street_name = "&streetname=#{querify(self.street_name)}"
    postal_code = "&postalcode=#{self.zip_code}"
    api_key = "xxxxx"
    url = query_string + street_number + street_name + postal_code + api_key
    # puts url
    response = nil
    begin
      response = RestClient.get(url)
    rescue RestClient::InternalServerError
      puts "Invalid Address"
      return 6666
    end
    json_data = parse_district_response(response)
    json_data["council_district"].to_i ? json_data["council_district"].to_i : 6666
  end

  def find_polling_place_id
    #call API here.
    #runs get_district(address) and finds polling place with that district
    #returns its ID
    #uses self.address to get polling place_id

    result = PollingPlace.find_polling_place_by_council_district(self.get_council_district) #returns a polling p place
    result!=nil ? self.polling_place_id = result.id : self.polling_place_id = 6666
    self.save
  end

  private

  def querify(string)
    string.gsub(' ', '%20')
  end

  def parse_district_response(response)
    JSON.parse(response)
  end

end

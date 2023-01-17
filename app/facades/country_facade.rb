class CountryFacade
  def self.country_details
    details = CountryService.all_countries
    details.map do |country|
      country[:name]
    end
  end

  def self.random_country
    random = country_details.shuffle
    random.first
  end
end
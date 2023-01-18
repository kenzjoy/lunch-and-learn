class CountryFacade
  def self.country_details
    details = CountryService.all_countries
    details.map do |country|
      Country.new(country)
      # country[:name][:common]
    end
  end

  def self.random_country
    country_details.sample.name
  end
end
class Country
  attr_reader :name

  def initialize(info)
    @name = info[:name]
  end
end
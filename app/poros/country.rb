class Country
  attr_reader :name

  def initialize(info)
    @name = info[:name][:common]
    # @name = info[:common]
  end
end
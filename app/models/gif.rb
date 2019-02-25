class Gif
  attr_reader :time, :summary, :url
  def initialize(attributes)
    # binding.pry
    @time = attributes[:time]
    @summary = attributes[:summary]
    @url = attributes[:url]
  end
end

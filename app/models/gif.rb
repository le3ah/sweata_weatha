class Gif
  attr_reader :time, :summary, :url
  def initialize(attributes)
    @time = attributes[:time]
    @summary = attributes[:summary]
    @url = attributes[:url]
  end
end

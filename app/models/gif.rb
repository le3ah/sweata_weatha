class Gif
  attr_reader :time, :summary, :url
  def initialize(attributes)
    # binding.pry
    @time = attributes[:time]
    @summary = attributes[:summary]
    @url = attributes[:images][:fixed_width][:url]
  end
end

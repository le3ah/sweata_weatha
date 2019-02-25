require 'rails_helper'

describe Gif do
  it "exists", :vcr do
    attributes = { data:
                  {
                    images:
                    [  {
                    time: "1541487600",
                    summary: "Mostly sunny in the morning.",
                    url: "<GIPHY_URL_GOES_HERE>"
                    } ]
                  } }
    gif = Gif.new(attributes)
    expect(gif).to be_a(Gif)
  end
end

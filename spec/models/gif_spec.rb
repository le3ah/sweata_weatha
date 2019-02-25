require 'rails_helper'

describe Gif do
  it "exists", :vcr do
    time =  "1541487600",
    summary = "Mostly sunny in the morning.",
    url = "<GIPHY_URL_GOES_HERE>"

    gif = Gif.new(time, url, summary)
    expect(gif).to be_a(Gif)
  end
end

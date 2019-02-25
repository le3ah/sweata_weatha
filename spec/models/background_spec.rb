require 'rails_helper'

describe Background do
  it "exists", :vcr do
    attributes = { farm: 5,
                   server: 10,
                   id: 4,
                   secret: "lkjdfi23",
                   title: "Rolling Meadow",
                   background_url: "https://example.com" }
    background = Background.new(attributes)
    expect(background).to be_a(Background)
  end
  it "#background_url", :vcr do
    attributes = { farm: 5,
                   server: 10,
                   id: 4,
                   secret: "lkjdfi23",
                   title: "Rolling Meadow",
                   background_url: "https://example.com" }
    background = Background.new(attributes)
    url =     "https://farm#{attributes[:farm]}.staticflickr.com/#{attributes[:server]}/#{attributes[:id]}_#{attributes[:secret]}.jpg"

    expect(background.background_url).to eq(url)
  end
end

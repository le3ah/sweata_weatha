require 'rails_helper'

describe Forecast do
  before :each do
    @attributes = { latitude: 1.2345,
                    longitude: -1.34235,
                    currently: {
                        icon: "clear-night",
                        summary: "Clear",
                        temperature_high: 45,
                        temperature_low: 23,
                        current_temperature: 33.37,
                        current_time: " 7 pm",
                        date: "2/24",
                        feels_like: 30.63,
                        humidity: 0.43,
                        visibility: 10,
                        uv_index: 0
                      },
                      hourly: [{
                          hourly_time:  7,
                          hourly_temperature: 36.18,
                          hourly_icon: "clear-night"
                      }],
                      daily: [  {
                            today_summary: "mostly cloudly",
                            precip_probability: 25,
                            precip_type: "snow",
                            temperature_high: 45,
                            temperature_low: 23
                            } ]
                    }
  end

  it "exists", :vcr do
    forecast = Forecast.new(@attributes)
    expect(forecast).to be_a(Forecast)
  end

  it "has attributes", :vcr do
    forecast = Forecast.new(@attributes)
    expect(forecast.latitude).to eq(@attributes[:latitude])
    expect(forecast.longitude).to eq(@attributes[:longitude])
    expect(forecast.currently).to eq(@attributes[:currently])
    expect(forecast.hourly).to eq(@attributes[:hourly])
    expect(forecast.daily).to eq(@attributes[:daily])
  end
end

require 'rails_helper'

describe Forecast do
  before :each do
    @attributes = {
    "data": {
        "id": "70278522252340",
        "type": "forecast",
        "attributes": {
            "latitude": 39.7392358,
            "longitude": -104.990251,
            "currently": {
                "icon": "clear-night",
                "summary": "Clear",
                "temperature_high": 45,
                "temperature_low": 23,
                "current_temperature": 33.37,
                "current_time": " 7 pm",
                "date": "2/24",
                "feels_like": 30.63,
                "humidity": 0.43,
                "visibility": 10,
                "uv_index": 0
            },
            "daily": [
                {
                    "today_summary": "mostly cloudly",
                    "precip_probability": 25,
                    "precip_type": "snow",
                    "temperature_high": 45,
                    "temperature_low": 23
                }, ],
            "hourly": [
                {
                    "hourly_time": " 7",
                    "hourly_temperature": 36.18,
                    "hourly_icon": "clear-night"
                },]
        }
    }
}
  end

  it "exists", :vcr do
    forecast = Forecast.new(@attributes)
    expect(forecast).to be_a(Forecast)
  end
end

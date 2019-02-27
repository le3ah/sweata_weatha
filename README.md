
[![Waffle.io - Columns and their card count](https://badge.waffle.io/le3ah/sweata_weatha.svg?columns=all)](https://waffle.io/le3ah/sweata_weatha)

# README

Sweater Weather (or _Sweata Weatha_ as preferred) is my final solo project in Module 3 of 4 at the Turing School of Software & Design.

This project is backend only and is a prerequisite for next module when we'll start diving into Javascript.  The project lasted 5 days and includes the following tech: Ruby on Rails & PostgreSQL.

Sweater Weather focuses on API creation and consumption, consuming the APIs from DarkSky, Google Geocoding, Flickr, & Giphy.  

#### [**_View Sweata Weatha in Production_**](https://sweata-weatha.herokuapp.com/)

## Getting Started

To run Thirsty Plants on your local machine, navigate to the directory in which you would like the project to be located, then execute the following commands:

```
$ git clone git@github.com:le3ah/thirsty_plants.git
$ cd thirsty_plants
$ bundle
$ rails g rspec:install
$ rails db:create
$ rails db:migrate
$ bundle exec figaro install
```
#### Setup your environment variables:

##### Sign Up on the following API's:
* [Dark Sky](https://darksky.net/dev)
* [Google Maps](https://developers.google.com/maps/documentation/javascript/get-api-key)
* [Flickr](https://www.flickr.com/services/api/)
* [Giphy](https://developers.giphy.com/)

Add the following code snippet to your `config/application.yml` file. Make sure to insert the key/secret without the alligator clips ( < > ).
```
darksky_api: <insert>
google_maps_api_key: <insert>
flickr_api: <insert>
giphy_api: <insert>

```

## Testing
I ran my tests using `rspec` and followed my coverage with SimpleCov.

<img width="950" alt="screen shot 2019-02-26 at 7 31 34 pm" src="https://user-images.githubusercontent.com/42391567/53461273-3fb75780-39fd-11e9-8da8-bbbaea819c85.png">

## Code Snippets
To make future me, who will potentially be concerned with views, happier, I used serializers to limit my response:
```
class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  set_id :object_id
  attributes :title, :background_url
end
```
In order to speed my site up, I tried my hand at low-level caching within my `DarkSky Service` as well:
```
def get_weather(lat, long)
  Rails.cache.fetch("weather_info_#{lat}_#{long}", expires_in: 1.hour) do
    response = conn.get("/forecast/#{ENV["darksky_api_secret"]}/#{lat},#{long}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
```

## Tools

* Figaro
* Faraday
* Shoulda-Matchers
* Factory Bot
* Dark Sky API
* Google Geocode API
* Flickr API
* Giphy API
* Waffle.io
* GitHub
* FactoryBot
* RSpec
* Capybara
* Pry
* Launchy
* SimpleCov
* PostgreSQL
* Ruby on Rails
* Fast JSON


## Rubric/Project Description
http://backend.turing.io/module3/projects/sweater_weather

## Author

* [Leah K. Miller](https://github.com/le3ah)

## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

  Method: GET
  Path: /abums

## 2. Design the Response

```
Doolittle
Surfer Rosa
OK Computer
```

## 3. Write Examples

_Replace these with your own design._

```
# Request:

Expected Response
GET /albums
Surfer Rosa
Waterloo
Super Trouper
Bossanova
Lover
Folklore
I Put a Spell on You
Baltimore
Here Comes the Sun
Fodder on My Wings
Ring Ring

```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /albums" do
    it "returns a list of all albums" do
    response = get('/albums')

    expected_response = 'Surfer Rosa, Waterloo, Super Trouper, Bossanova, Lover, Folklore, I Put a Spell on You, Baltimore, Here Comes the Sun, Fodder on My Wings, Ring Ring'

    expect(response.status).to eq(200)
    expect(response.body).to eq(expected_response)
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
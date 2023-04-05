## 1. Design the Route Signature

You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

  Method: POST
  Path: /albums

## 2. Design the Response

```
Expected response is 200 OK
We do not expect any content
```

## 3. Write Examples

_Replace these with your own design._

```
# Request:
params
title=Voyage
release_year=2022
artist_id=2

```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "POST /albums" do
    it "creates a new album" do
    response = post('/albums')

    expect(response.status).to eq(200)
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
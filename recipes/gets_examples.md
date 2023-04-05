```ruby
describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /" do
    it 'returns a hello page if password is correct' do
      response = get('/', password: 'abcd')

      expect(response.body).to include('Hello!')
    end

    it 'returns forbidden page with wrong password' do
      response = get('/', password: 'ahsc')

      expect(response.body).to include('Forbidden!')
    end
  end

    context "GET /" do
        it "returns a html list of names" do
        response = get('/')

        expect(response.body).to include('<p>Sidra</p>')
        expect(response.body).to include('<p>Tim</p>')
        expect(response.body).to include('<p>Tom</p>')
    end

      context "GET /albums" do
        it "returns a list of all albums" do
        response = get('/albums')

        expected_response = 'Surfer Rosa, Waterloo, Super Trouper, Bossanova, Lover, Folklore, I Put a Spell on You, Baltimore, Here Comes the Sun, Fodder on My Wings, Ring Ring'

        expect(response.status).to eq(200)
        expect(response.body).to eq(expected_response)
    end
  end


    context "GET /" do
        it "returns Hello world!" do
        response = get('/')
        expect(response.body).to include('<h1>Hello world</h1>')
        end
    end



      get '/' do
        return index(:erb)
      end

```
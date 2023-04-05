require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /albums/:id" do
    it "returns the HTML content for album 1" do
      response = get('/albums/2')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Surfer Rosa</h1>')
      expect(response.body).to include('Release year: 1988')
    end
  end

  context "GET /artists/:id" do
    it "returns a HTML output of individual artist" do
      response = get('/artists/1')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Pixies</h1>')
    end
  end

  context "GET /albums" do
    it "returns a HTML list of all albums with links to each album" do
    response = get('/albums')

    expect(response.status).to eq(200)
    expect(response.body).to include('<a href="/albums/2">Surfer Rosa</a></br>')
    expect(response.body).to include('<a href="/albums/3">Waterloo</a></br>')
    end
  end

  context "GET /artists" do
    it "returns a HTML list of all artists with links to each artist" do
    response = get('/artists')

    expect(response.status).to eq(200)
    expect(response.body).to include('<a href="/artists/1"')
    expect(response.body).to include('Pixies</a>')
    expect(response.body).to include('Nina Simone</a>')
    end
  end

  context "POST /albums" do
    it 'should validate album parameters' do
      response = post(
        '/albums',
        invalid_album_title: 'OK Computer',
        another_invalid_thing: 123)

        expect(response.status).to eq(400)
    end

    it "creates a new album" do
    response = post('/albums', 
    title: 'OK Computer', 
    release_year: '1997', 
    artist_id: '1')
    
    expect(response.status).to eq(200)
    expect(response.body).to eq('')

    response = get('/albums')

    expect(response.body).to include('OK Computer')
    end
  end

  context "POST /artists" do
    it 'should validate artist parameters' do
      response = post(
        '/albums',
        invalid_artist_name: '123',
        invalid_other_thing: 34)

        expect(response.status).to eq 400
    end

    it "creates a new artist" do
    response = post('/artists', 
    name: 'Britney Spears',
    genre: 'Pop')
    
    expect(response.status).to eq(200)
    expect(response.body).to eq('')

    response = get('/artists')

    expect(response.body).to include('Britney Spears')
    end
  end

  context 'GET /albums/new' do
    it 'should return the html form to create a new album' do
      response = get('/albums/new')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/albums">')
      expect(response.body).to include('<input type="text" name="title">')
    end
  end

  context 'GET /artists/new' do
    it 'should return the html form to create new artist' do
      response = get('/artists/new')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/artists">')
      expect(response.body).to include('<input type="text" name="name">')
    end
  end
end

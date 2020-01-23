require 'rails_helper'

describe "Cats API", type: :request do
  it "gets a list of Cats" do
    # Create a new cat in the Test Database (not the same one as development)
    Cat.create(name: 'Felix', age: 2, city: 'San Diego', bio: 'Walks in the park')

    # Make a request to the API
    get '/cats'

    # Convert the response into a Ruby Hash
    json = JSON.parse(response.body)

    # Assure that we got a successful response
    expect(response).to have_http_status(:ok)

    # Assure that we got one result back as expected
    expect(json.length).to eq 1
  end
  it "creates a cat" do
    # The params we are going to send with the request
    cat_params = {
      cat: {
        name: 'Buster',
        age: 4,
        city: 'El Cajon',
        bio: 'Meow Mix, and plenty of sunshine.'
      }
    }

    # Send the request to the server
    post '/cats', params: cat_params

    # Assure that we get a success back
    expect(response).to have_http_status(:ok)

    # Look up the cat we expect to be created in the Database
    new_cat = Cat.first

    # Assure that the created cat has the correct attributes
    expect(new_cat.name).to eq('Buster')
  end
  it "doesn't create a cat without a name" do
  cat_params = {
    cat: {
      age: 4,
      city: 'Culver City',
      bio: 'Meow Mix, and plenty of sunshine.'
    }
  }

  post '/cats', params: cat_params

  # This is a new test to make sure that our status is correct when the record can't be created
  # You can read more about HTTP response codes here: https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
  expect(response.status).to eq 422

  # We also want to check that the API lets us know what is wrong, so the frontend can prompt the user to fix it.
  json = JSON.parse(response.body)
  # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
  expect(json['name']).to include "can't be blank"
  end

  it "doesn't create a cat without a age" do
  cat_params = {
    cat: {
      name: "Rusty",
      city: 'Culver City',
      bio: 'Meow Mix, and plenty of sunshine.'
    }
  }

  post '/cats', params: cat_params
  expect(response.status).to eq 422
  json = JSON.parse(response.body)
  expect(json['age']).to include "can't be blank"
  end

  it "doesn't create a cat without a city" do
  cat_params = {
    cat: {
      age: 4,
      name: 'Culver City',
      bio: 'Meow Mix, and plenty of sunshine.'
    }
  }

  post '/cats', params: cat_params
  expect(response.status).to eq 422
  json = JSON.parse(response.body)
  expect(json['city']).to include "can't be blank"
  end

  it "doesn't create a cat without a bio" do
  cat_params = {
    cat: {
      age: 4,
      city: 'Culver City',
      name: 'Meow Mix, and plenty of sunshine.'
    }
  }

  post '/cats', params: cat_params
  expect(response.status).to eq 422
  json = JSON.parse(response.body)
  expect(json['bio']).to include "can't be blank"
  end
end

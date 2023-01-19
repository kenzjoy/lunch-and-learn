The concept behind Lunch & Learn is to gain experience as a back-end developer working on a team that is building an application to search for cuisines by country, and provide opportunity to learn more about that countries culture. The user-facing app will allow users to search for recipes by country, favorite recipes, and learn more about a particular country.

The goal is a back-end developer will learn how to contribute towards a project that is built using a service-oriented architecture. The front-end will communicate with the back-end through an API. The job of the back-end team is to expose that API that satisfies the front-end team’s requirements.

## Learning Goals
> - Expose an API that aggregates data from multiple external APIs
> - Expose an API that requires an authentication token
> - Expose an API for CRUD functionality
> - Determine completion criteria based on the needs of other developers
> - Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).

## Technologies Used
> - Ruby 2.7.4
> - Rails 5.2.8.1
> - PostgreSQL
> - RSpec
> - `figaro gem` (creates an *application.yml* file on your local machine where you can safely store your required API keys)
> - `faraday gem` (allows the program to create a secure connection to the API)
> - `jsonapi-serializer gem` (automates aspects of the serialization process)

## Required API Keys
> - [edamam](https://api.edamam.com/)
> - [youtube](https://developers.google.com/youtube/v3) 
> - [unsplash](https://unsplash.com/developers)
> - [rest countries](https://restcountries.com/) *no signup required*

## Local Setup
```
git clone git@github.com:kenzjoy/lunch-and-learn.git
cd lunch-and-learn
bundle exec figaro install
add required API keys to application.yml folder
bundle install
rails db:{create,migrate}
```
## Testing
> Once you have the local setup complete, you can run the following code to check the test suite:
> `bundle exec rspec spec`

# experince the data come to life >>>
> - Start by running `rails s` in your terminal
> - Using an API platform such as [Postman](https://www.postman.com/), enter each of the following endpoints and follow any associated instructions to interact with the exposed endpoints

## API Endpoints 
> Base URL: [http://localhost:3000](http://localhost:3000)
> 1. `GET /api/v1/recipes?country=canada` - play around with using other country names to expose more data. You can also omit the country search to generate a random country by instead using `GET /api/v1/recipes`
>
> **EXAMPLE RESPONSE:**
> <img width="900" alt="Screenshot 2023-01-18 at 5 02 47 PM" src="https://user-images.githubusercontent.com/108506841/213324370-20a1301c-9919-4bb4-8975-3c28c471c833.png">
> 
> 2. `GET /api/v1/learning_resources?country=brazil` - this endpoint will return one educational video and ten images that match that country's search
>
> **EXAMPLE RESPONSE:**
> <img width="850" alt="Screenshot 2023-01-18 at 5 06 58 PM" src="https://user-images.githubusercontent.com/108506841/213324879-2e185d6c-dcb7-4bd8-b0ea-71e754c684d1.png">


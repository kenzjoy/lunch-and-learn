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
bundle install
rails db:{create,migrate}
rails s
```

## API Endpoints 
> Base URL: [http://localhost:3000/api/v1](http://localhost:3000/api/v1)

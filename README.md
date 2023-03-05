* SETUP

* Ruby version
  ruby 3.0.2

* Rails version
    rails 7.0.4

* Bundle Install
  Run command `bundle install` to install dependencies

* Database creation
  Run the commands respectively 
  `rails db:create`
  `rails db:migrate`
  `rails db:seed` (This will seed user data into the db, this optional)

* Start Rails Server
  Run the command `rails s` or `rails s -p 4000` 
  default rails port is 3000 but can be changed by using the -p flag

  Visit localhost:3000 to ensure rails app is up and running perfectly.

* Endpoints and payloads
  * View Alerts
    Visit localhost:3000/homes
    PS: Although this is an API only app, this view is added to show all task as requested.

  * Create Alert 
    POST localhost:3000/alerts
    paylaod: 
    {
    "alert": {
        "type": "portal_closed",
        "description": "An alert for portal clsoed",
        "origin": ""172.23.4.0,
        "tag": ["version15", "development"]
    }
    }
  * Get all Alerts
    GET localhost:3000/alerts
    payload: nil

  * Show Alert
    GET localhost:3000/alerts/:id
    payload: nil

  * Login
    POST localhost:3000/api/login
    payload:
    user: {
        email: user_email,
        password: user_password
      }

  * Signup
    POST POST localhost:3000/api/signup
     payload:
    user: {
        email: user_email,
        password: user_password
        password_confirmation: user_password
    }

  PS: A user is expected to pass in bearer token to the request header, this token is received after user login.

* How to run the test suite
  Run the command `bundle exec rspec spec`

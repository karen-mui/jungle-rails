# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

### Home page
!["Home Page"](https://github.com/karen-mui/jungle-rails/blob/master/docs/Home%20Page%20(Product%20Index).png?raw=true)
The home page features a navigation bar and all the products indexed.

### Registration
!["Registration Page"](https://github.com/karen-mui/jungle-rails/blob/master/docs/Registration.png?raw=true)
Users can register an account. They can also login/logout (not shown).

### Admin Capabilities
!["Basic HTTP Auth for Admins"](https://github.com/karen-mui/jungle-rails/blob/master/docs/Basic%20HTTP%20Authentication%20for%20Admins.png?raw=true)
Admins are granted access using basic http authentication.

!["Admin Editing Categories"])(https://github.com/karen-mui/jungle-rails/blob/master/docs/Admin%20Edit%20Categories.png?raw=true)
Admins can edit categories. They can also edit products individually (not shown).

### Checkout
!["Checkout with Stripe"](https://github.com/karen-mui/jungle-rails/blob/master/docs/Checkout%20with%20Test%20Stripe%20Account.png?raw=true)
Checkout with stripe in test mode is implemented in this application.


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

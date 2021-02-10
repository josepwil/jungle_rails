# Jungle

A full stack e-commerce application built with Ruby on Rails.

Tech Stack: Ruby, Rails, RSpec, Poltergeist/Capybara, ERB, Stripe API, Active Record, Postgres

## Final Product

Products page: shows all products available for purchase
!["Products Page"](https://github.com/josepwil/jungle_rails/blob/master/screenshots/products.png?raw=true)

A soldout badge is applied when a product is not in stock
!["Sold Out"](https://github.com/josepwil/jungle_rails/blob/master/screenshots/soldout.png?raw=true)

Invidual Product page
!["Individual product page"](https://github.com/josepwil/jungle_rails/blob/master/screenshots/individualProduct.png?raw=true)

Cart page
!["Cart page"](https://github.com/josepwil/jungle_rails/blob/master/screenshots/cart.png?raw=true)


Payment 
!["Payment"](https://github.com/josepwil/jungle_rails/blob/master/screenshots/payment.png?raw=true)

Admin: an admin can create new products/categories and sales
!["Admin](https://github.com/josepwil/jungle_rails/blob/master/screenshots/admin.png?raw=true)




## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

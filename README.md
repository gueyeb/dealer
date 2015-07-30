[![Code Climate](https://codeclimate.com/github/BigGillyStyle/dealer/badges/gpa.svg)](https://codeclimate.com/github/BigGillyStyle/dealer)
[![Test Coverage](https://codeclimate.com/github/BigGillyStyle/dealer/badges/coverage.svg)](https://codeclimate.com/github/BigGillyStyle/dealer)
[![Build Status](https://travis-ci.org/BigGillyStyle/dealer.svg?branch=master)](https://travis-ci.org/BigGillyStyle/dealer)
[![Dependency Status](https://gemnasium.com/BigGillyStyle/dealer.svg)](https://gemnasium.com/BigGillyStyle/dealer)
[![security](https://hakiri.io/github/BigGillyStyle/dealer/master.svg)](https://hakiri.io/github/BigGillyStyle/dealer/master)
[![License](http://img.shields.io/license/MIT.png?color=green)](http://opensource.org/licenses/MIT)

Dealer
================

This Ruby on Rails application primarily serves the following purposes:

- Is an online car dealership platform (that is deployed to Heroku and used in production for a friend's
car brokerage business)
- Is a platform for me to develop and demonstrate my Ruby on Rails coding skills

Dependencies
-------------

This application requires:

- Ruby 2.2.x (MRI, not JRuby or Rubinius)
- Rails 4.2.x

This application is developed and tested with the following:

- PostgreSQL 9.4.x (latest)

This application has been designed to be deployed to Heroku (primarily through using the
[rails_12factor](https://github.com/heroku/rails_12factor) gem).  It should not be difficult to deploy this to other
environments, as no specific Heroku calls are made...although several Heroku add-ons (Rollbar, New Relic, etc) have
been utilized along with their corresponding gems.

Key Features
------------

I have intentionally crafted this codebase to offer the website owner the following benefits:

- Relatively simple Ruby on Rails application that should be supportable by most "Rails developers".  In particular I
have not included much in the way of client side JavaScript (AngularJS in particular), because that is not yet a
ubiquitous skillset.  I do not want to be the "single point of failure" for maintenance of this website and thus am
trying to keep everything well-tested and straightforward.
- Up-to-date dependencies.  Since the corresponding website is expected to be a dependable part of the website owner's
business, I intend to keep all the associated technologies (including the Ruby and Rails versions) updated regularly.  This
tends to be easier when there are fewer gems and complications in the codebase.

Problems? Issues?
-----------

If the application doesn’t work as expected, please [report an issue](https://github.com/BigGillyStyle/dealer/issues)
and include the diagnostics.

Credits
-------

This application was generated with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).

Rails Composer is open source and supported by subscribers. Please join RailsApps to support development of Rails Composer.

License
-------

[MIT license](http://opensource.org/licenses/MIT)
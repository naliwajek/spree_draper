spree_draper
============

Use [Draper](https://github.com/drapergem/draper) gem in your Spree application without overriding
anything. Works both in the front-end (user interface) and in the back-end (admin-panel).

Installation
------------

Add spree_draper to your Gemfile:

```ruby
gem 'spree_draper', github: 'naliwajek/spree_draper', branch: '2-1-stable'
```

And install:

```shell
bundle install
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

Copyright (c) 2015 Jakub Naliwajek, released under the New BSD License

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

Usage
-----

Create your Draper decorators as usual:

```ruby
# app/decorators/spree/user_decorator.rb
module Spree
  class UserDecorator < Draper::Decorator
    delegate_all

    def full_name
      "#{ first_name } #{ last_name }"
    end
  end
end
```

In your controller:

```ruby
# app/controllers/spree/orders_controller_decorator.rb
module Spree
  OrdersController.class_eval do
    spree_decorate :order, :user
    # in view:
    # @order.decorated? => true
    # @user.decorated? => true

    ...
  end
end
```

If in current action there's no instance variable with a given name, nothing
will happen.

Why?
----

Now you don't have to override entire actions just to decorate something:

```ruby
module Spree
  OrdersController.class_eval do
    def show
      @order = Spree::Order.find_by_number!(params[:id]).decorate
      # uncool, whole action overriden just to add 9 letters: .decorate
    end
  end
end
```

I created this because you obviously can't decorate in `before_action`
where your instance variable might not be set yet. You can't use
`after_action` either because that triggers way after rendering the view.

In Spree you also can't use
[decent_exposure](https://github.com/hashrocket/decent_exposure) because
every single plugin will anticipate normal instance variables, not exposed, so you can't decorate in `expose(:var) { ... }` block either.

That is why this gem hooks right before rendering and tries (by the
`try` method) to decorate every variable passed to it.

Have a better idea? Tell me in the issues!

TODO
----

- tests
- `only`, `except` options, just like in the `before/after_action`
- allow to pass variable such as `{ user: :SpecialUserDecorator }` for
  those special cases when you want to use different decorator

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

Copyright (c) 2015 Jakub Naliwajek, released under the New BSD License

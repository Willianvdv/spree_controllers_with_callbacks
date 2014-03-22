[WIP] Spree Controllers With Callbacks
======================================

[![Build Status](https://travis-ci.org/Willianvdv/spree_controllers_with_callbacks.svg)](https://travis-ci.org/Willianvdv/spree_controllers_with_callbacks)

Makes extending controllers fun again.

Installation
------------

Add spree_controllers_with_callbacks to your Gemfile:

```ruby
gem 'spree_controllers_with_callbacks', github: 'willianvdv/spree_controllers_with_callbacks'
```

Supported controllers / actions
-------------------------------

- Spree::ProductController#show
- Spree::ProductController#index



Usage
-----

Lets say you only want to show blue products in your index. Just do:

```
Spree::ProductController.class_eval do
  set_callback :index, :after, :only_show_blue_products

  private

  def only_show_blue_products
    @products = @products.where(color: 'blue')
  end
end

```
Or make conditional callbacks:
```
Spree::ProductController.class_eval do
  set_callback :index, :only_show_blue_products, if: -> { self.likes_blue? }
end
```

If some extension uses this callback module and removed for some reason all
yellow products, you can get this undone by doing:
```
Spree::ProductController.class_eval do
  skip_callback :index, :only_show_yellow_products
end
```

The great thing is, if you want to add another filter on an existing filter chain.
Just register a new callback like I did in the first example


Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

Copyright (c) 2014 Willian van der Velde, released under the New BSD License

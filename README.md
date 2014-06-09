rspec-lets
====================

`lets` and `lets` as an alternate syntax for `let` and `let!` that allow
you to define multiple variables within one call, for cleaner
definitions of test variables. As a bonus, you also get `help` to define
helper methods in the same declarative way!

## Usage

Add this to your Gemfile:

```ruby
gem 'rspec-lets', group: :test
```

In your `spec_helper` add:

```ruby
# At the top of the file
require 'rspec_lets_helper'

# In the config block
config.include RSpecLetsHelper
```

In your specs, instead of writing:

```ruby
let(:admin) { create(:admin) }
let(:user)  { create(:user)  }
```

You can now write:

```ruby
lets(admin: -> { create(:admin),
     user:  -> { create(:user))
```

Or alternatively:
```ruby
lets([:admin, :user] =>
     ->(i, key) { create(key) })
```

The same syntax applies for `lets!`.

You can also define a helper method in the same style:
```ruby
help(foo: ->(val) { val * 2 })
```

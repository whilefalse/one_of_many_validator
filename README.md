# OneOfManyValidator

Provides validation for when one of a set of fields is required not to be blank,
but no one particular field is required on its own.

## Installation

Add this line to your application's Gemfile:

    gem 'one_of_many_validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install one_of_many_validator

## Usage

A common use case is validating that a user provides either a mobile number or
landline phone number.

You could do this like so:

    validates_with OneOfManyValidator, :fields => [:mobile, :landline]

This will pass validation if either :mobile or :landline is provided, and will
fail validation if both are blank.

The I18n key used will follow the [Rails standard](http://guides.rubyonrails.org/i18n.html#error-message-scopes), so in this example the error key will be:

    activerecord.errors.models.[model_name].attributes.mobile_and_landline_blank

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

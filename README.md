# Virtual SMS

[![Build Status](https://api.travis-ci.org/emn178/virtual_sms.png)](https://travis-ci.org/emn178/virtual_sms)  
[![Coverage Status](https://coveralls.io/repos/emn178/virtual_sms/badge.svg?branch=master)](https://coveralls.io/r/emn178/virtual_sms?branch=master)

A rails plugin that provides a virtual SMS box and [SMS Carrier](https://github.com/emn178/sms_carrier) delivery method. You can send SMS to this virtual SMS box instead of real SMS service in development environment, and you can preview the SMSes in this virtual SMS box in web page.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'virtual_sms', group: :development
```
Make sure you have:
```ruby
gem 'jquery-rails'
```

And then execute:

    bundle

### Route
Add virtual SMS box route in your `config/route.rb`
```Ruby
mount VirtualSms::Engine => "/virtual_sms" if Rails.env.development?
```

### Delivery Method
Set up delivery method of action mailer in your `config/environments/developmnet.rb`
```Ruby
config.sms_carrier.delivery_method = :virtual
```

## Usage
Now, you can go to http://localhost:3000/virtual_sms and check the SMSes!

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Contact
The project's website is located at https://github.com/emn178/virtual_sms  
Author: emn178@gmail.com

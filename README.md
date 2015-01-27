# Bitreserve

[![Gem Version](https://badge.fury.io/rb/bitreserve.svg)](http://badge.fury.io/rb/bitreserve)
[![Build Status](https://travis-ci.org/groupbuddies/bitreserve.svg?branch=master)](https://travis-ci.org/groupbuddies/bitreserve)
[![Code Climate](https://codeclimate.com/github/groupbuddies/bitreserve/badges/gpa.svg)](https://codeclimate.com/github/groupbuddies/bitreserve)
[![Test Coverage](https://codeclimate.com/github/groupbuddies/bitreserve/badges/coverage.svg)](https://codeclimate.com/github/groupbuddies/bitreserve)

A ruby client for the [Bitreserve](https://bitreserve.org/) API.

# Installation

Add this line to your application's Gemfile:

```ruby
gem 'bitreserve'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bitreserve

# Contents

* [Usage](#usage)
* [Authentication](#authentication)
  * [OAuth2](#oauth2)
  * [Basic Auth](#basic-auth)
  * [Personal Access Token](#personal-access-token)
    * [Via argument](#via-argument)
    * [Via environment variable](#via-environment-variable)
* [API calls](#endpoints)
  * [Currencies](#currencies)
  * [Tickers](#tickers)
  * [Entities](#entities)
  * [Cards](#cards)
  * [Transactions](#transactions)
  * [Contacts](#contacts)
  * [Users](#users)
  * [Transparency](#transparency)
* [Contributing](#contributing)

# Usage

To use the gem, you have to instantiate a client. All API calls are made from there. Here's a minimal working example:

```ruby
require 'bitreserve'

client = Bitreserve::Client.new
puts client.all_tickers
```

# Authentication

## OAuth2

TODO

## Basic Auth

TODO

## Personal Access Token

If you already have a token, you can use by setting an environment variable, or by passing when instantiating the client

### Via argument

Pass the token to the constructor:

```ruby
Bitreserve::Client.new(token: 'your-access-token')
```

### Via environment variable

Set the environment variable using [dotenv](https://github.com/bkeepers/dotenv), or by exporting it in your shell:

```bash
$ export BITRESERVE_AUTH_TOKEN="your-access-token"
```

Then instantiate the client:

```ruby
Bitreserve::Client.new
```

# Endpoints

## Currencies

TODO

## Tickers

TODO

## Entities

TODO

## Cards

TODO

## Transactions

TODO

## Contacts

TODO

## Users

[*Bitreserve documentation on users*](https://developer.bitreserve.org/api/v0/#users)

**Return the details of the current user:**

```ruby
client.me
```


**Return the list of phone numbers associated with the current user:**

```ruby
client.phones
```

## Transparency

TODO


# Contributing

1. Fork it ( https://github.com/groupbuddies/bitreserve/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
4. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

# Copyright

Copyright (c) 2015 Group Buddies. See [LICENSE.txt](LICENSE.txt) for further details.

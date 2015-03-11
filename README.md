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
* [Creating an authenticated client](#creating-an-authenticated-client)
  * [Personal Access Token](#personal-access-token)
    * [Via argument](#via-argument)
    * [Via environment variable](#via-environment-variable)
* [Endpoints](#endpoints)
  * [Authentication](#authentication)
    * [OAuth2](#oauth2)
    * [Basic Authentication](#basic-authentication)
  * [Tickers](#tickers)
  * [Entities](#entities)
  * [Cards](#cards)
  * [Transactions](#transactions)
    * [Public Transactions](#public-transactions)
    * [Private Transactions](#private-transactions)
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

# Creating an authenticated client

In order to make most of the API calls, you will need to authenticate your
client. Here's how you can do that.

## Personal Access Token

If you don't have a PAT, learn how to generate one
[here](#basic-authentication).

If you already have a token, you can use it by setting an environment variable,
or by passing it when instantiating the client.

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

This is a comprehensive list of all the mappings between this wrapper and the
Bitreserve's API.

## Authentication

[*Bitreserve documentation on authentication*](https://developer.bitreserve.org/api/v0/#authentication)

### OAuth2

**NOT SUPPORTED BY BITRESERVE YET**

### Basic Authentication

[*Bireserve documentation on basic authentication*](https://developer.bitreserve.org/api/v0/#basic-authentication)

The only thing you need, in order to use basic authentication is a Personal
Access Token, everything else is transparent to you. If you already have a
token, see how to use it [here](#personal-access-token).

```ruby
client.generate_access_token(username: 'your-bitreserve-username', password:
'your-bitreserve-password', otp: 'a-valid-bitreserve-otp')
```

To generate a valid OTP you can install [Authy](https://www.authy.com/), follow
it's set up process and choose bitreserve. You should be prompted with a set of
numbers, which is your OTP (it only lasts 30 seconds, so you have to be quick).

## Tickers

[*Bitreserve documentation on tickers*](https://developer.bitreserve.org/api/v0/#tickers)

**Return the current rates on Bitreserve for all currency pairs:**

```ruby
client.all_tickers
```

**Return the current rates on Bitreserve for a specific currency:**

```ruby
client.find_ticker(currency: 'EUR')
```

## Cards

[*Bitreserve documentation on cards*](https://developer.bitreserve.org/api/v0/#cards)

**Return all the user's cards:**

```ruby
client.all_cards
```

**Return the details for a specific card associated with the user:**

```ruby
client.find_card(id: '37e002a7-8508-4268-a18c-7335a6ddf24b')
```

**Create a card for the user:**

```ruby
client.create_card(label: 'My label', currency: 'BTC')
```

## Transactions

[*Bitreserve documentation on transactions*](https://developer.bitreserve.org/api/v0/#transactions)

You can interact with both the authenticated user's and public transactions.

### Public Transactions

**Return the public view of all transactions in the reserve:**

```ruby
client.all_public_transactions
```

**Return the public view of a specific transaction:**

```ruby
client.find_public_transactions(id: 'a97bb994-6e24-4a89-b653-e0a6d0bcf634')
```

### Private Transactions

**Create a transaction:**

```ruby
client.create_transaction(card_id: 'a6d35fcd-xxxx-9c9d1dda6d57', currency:
'BTC', amount: 0.1, destination: 'foo@bar.com')
```

**Commit a transaction:**

```ruby
client.commit_transaction(card_id: 'a6d35fcd-xxxx-9c9d1dda6d57', transaction_id:
'd51b4e4e-9827-40fb-8763-e0ea2880085b')
```

**Cancel a transaction:**

```ruby
client.cancel_transaction(card_id: 'a6d35fcd-xxxx-9c9d1dda6d57', transaction_id:
'd51b4e4e-9827-40fb-8763-e0ea2880085b')
```

**Resend a transaction:**

```ruby
client.resend_transaction(card_id: 'a6d35fcd-xxxx-9c9d1dda6d57', transaction_id:
'd51b4e4e-9827-40fb-8763-e0ea2880085b')
```

**Return all transactions associated with the user:**

```ruby
client.all_user_transactions
```

**Return all transactions associated with a card:**

```ruby
client.all_card_transactions
```

## Contacts

[*Bitreserve documentation on contacts*](https://developer.bitreserve.org/api/v0/#contacts)

**Return all the user's contacts:**

```ruby
client.all_contacts
```

**Return the details for a specific contact associated with the user:**

```ruby
client.find_contact(id: '9fae84eb-712d-4b6a-9b2c-764bdde4c079')
```

**Create a contact for the user:**

```ruby
client.create_contact(first_name: 'Luke', last_name: 'Skywalker', company: 'Lars
Moisture Farm Inc', emails: ['support@larsmoisturefarm.com')
```

## Users

[*Bitreserve documentation on users*](https://developer.bitreserve.org/api/v0/#users)

**Return the details of the user:**

```ruby
client.me
```

**Return the list of phone numbers associated with the user:**

```ruby
client.phones
```

## Transparency

[*Bitreserve documentation on transparency*](https://developer.bitreserve.org/api/v0/#reserve-status)

**Return a summary of all obligations and assets:**

```ruby
client.statistics
```

# Contributing

1. Fork it ( https://github.com/groupbuddies/bitreserve/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
4. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

# Copyright

Copyright (c) 2015 Group Buddies. See [LICENSE.txt](LICENSE.txt) for further details.

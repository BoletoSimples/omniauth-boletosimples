# OmniAuth BoletoSimples

[![Gem Version](https://badge.fury.io/rb/omniauth-boletosimples.svg)](http://badge.fury.io/rb/omniauth-boletosimples)

This gem contains the Log In With Boleto Simples strategy for OmniAuth.

## Installing

Add to your `Gemfile`:

```ruby
gem "omniauth-boletosimples"
```

Then:

		$ bundle install

## Usage

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`.

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :boletosimples, ENV['APP_ID'], ENV['APP_TOKEN'], environment: :sandbox, scope: "profile email", user_agent: 'Your App (yourapp@example.com)'
end
```

It is important to set user_agent with a valid email address inside, otherwise the integration will not work.

## Attributes and Scopes

The possible attributes to be returned at the moment are:

```ruby
info['person_type']
info['first_name']
info['middle_name']
info['last_name']
info['full_name']
info['date_of_birth']
info['email']
info['cpf']

extra['address_street_name']
extra['address_number']
extra['address_complement']
extra['address_state']
extra['address_city_name']
extra['address_neighborhood']
extra['address_postal_code']
extra['phone_number']
extra['banking_bank_number']
extra['banking_agency_number']
extra['banking_agency_digit']
extra['banking_account_number']
extra['banking_account_digit']
extra['banking_person_type']
extra['banking_person_name']
extra['banking_cnpj_cpf']
extra['business_name']
extra['business_cnpj']

```

The actual set of attributes returned depends on the scopes set. The currently available scopes are:

```
login
profile
email
phone
address
banking
business
write
read
webhook
```

## Registering for an API key

To register your application for Log In With Boleto Simples [open a ticket](http://suporte.boletosimples.com.br) asking for credentials to your app.

## Example of result auth hash
With all scopes requested.

```yaml
provider: boletosimples
uid: 1
info:
  person_type: 'individual'
  first_name: 'Henry Renato'
  middle_name: 'Leonardo'
  last_name: 'Barros'
  full_name: 'Henry Renato Leonardo Barros'
  date_of_birth: '1987-04-01'
  email: 'henry@example.com'
  cpf: '139.586.432-21'
credentials:
  token: <token>
  refresh_token: <refresh token>
  expires_at: 1355082790
  expires: true
extra:
  address_street_name: 'Rua AS 3'
  address_number: '349'
  address_complement: 'apto 101'
  address_state: 'GO'
  address_city_name: 'Rio Verde'
  address_neighborhood: 'Residencial Água Santa'
  address_postal_code: '75909-517'
  phone_number: '6336151015'
  banking_bank_number: '237'
  banking_agency_number: '3290'
  banking_agency_digit: '1'
  banking_account_number: '1028'
  banking_account_digit: '9'
  banking_person_type: 'individual'
  banking_person_name: 'Henry Renato Leonardo Barros'
  banking_cnpj_cpf: '139.586.432-21'
  business_name: 'Boleto Simples Cobranças Ltda'
  business_cnpj: '05.813.794/0001-26'
```

## Issues

If you have problems, please create a [Github Issue](https://github.com/BoletoSimples/omniauth-boletosimples/issues).

## Sample Code
Check our [Sample Code](https://github.com/BoletoSimples/login-with-boletosimples-demo-rails)

## Contributing

Please see [CONTRIBUTING.md](https://github.com/BoletoSimples/omniauth-boletosimples/blob/master/CONTRIBUTING.md) for details.

## Credits

OmniAuth BoletoSimples was originally written by [Rafael Lima](http://rafael.adm.br) based on [omniauth-paypal](https://github.com/datariot/omniauth-paypal)
Thank you to all the [contributors](https://github.com/BoletoSimples/omniauth-boletosimples/graphs/contributors).

## License

OmniAuth BoletoSimples is Copyright © 2014 Rafael Lima. It is free software, and may be redistributed under the terms specified in the [LICENSE](https://github.com/BoletoSimples/omniauth-boletosimples/blob/master/LICENSE) file.
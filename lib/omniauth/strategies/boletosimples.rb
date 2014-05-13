require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class BoletoSimples < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = "profile"
      ENVIRONMENTS = {
        development: 'http://localhost:5000',
        sandbox: 'https://sandbox.boletosimples.com.br',
        production: 'https://boletosimples.com.br',
      }
      option :name, 'boletosimples'
      option :client_options, {
        :token_url     => '/api/v1/oauth2/token',
        :setup         => true
      }

      option :authorize_options, [:scope, :response_type]
      option :provider_ignores_state, true
      option :environment, :production

      uid { raw_info['id'] }

      info do
        {
          person_type: raw_info['person_type'],
          first_name: raw_info[':first_name'],
          middle_name: raw_info[':middle_name'],
          last_name: raw_info[':last_name'],
          full_name: raw_info[':full_name'],
          date_of_birth: raw_info[':date_of_birth'],
          email: raw_info['email'],
          cpf: raw_info['cpf']
        }
      end

      extra do
        {
          address_street_name: raw_info['address_street_name'],
          address_number: raw_info['address_number'],
          address_complement: raw_info['address_complement'],
          address_state: raw_info['address_state'],
          address_city_name: raw_info['address_city_name'],
          address_neighborhood: raw_info['address_neighborhood'],
          address_postal_code: raw_info['address_postal_code'],
          phone_number: raw_info['phone_number'],
          banking_bank_number: raw_info['banking_bank_number'],
          banking_agency_number: raw_info['banking_agency_number'],
          banking_agency_digit: raw_info['banking_agency_digit'],
          banking_account_number: raw_info['banking_account_number'],
          banking_account_digit: raw_info['banking_account_digit'],
          banking_person_type: raw_info['banking_person_type'],
          banking_person_name: raw_info['banking_person_name'],
          banking_cnpj_cpf: raw_info['banking_cnpj_cpf'],
          business_name: raw_info['business_name'],
          business_cnpj: raw_info['business_cnpj']          
        }
      end

      def setup_phase
        environment = options.environment || :production
        options.client_options[:site] = ENVIRONMENTS[environment.to_sym]
        options.client_options[:authorize_url] = "#{ENVIRONMENTS[environment.to_sym]}/api/v1/oauth2/authorize"
        options.client_options[:connection_opts] = {
          headers: {
            'User-Agent' => options.user_agent,
          }
        } if options.user_agent
      end

      def raw_info
        @raw_info ||= load_identity
      end

      def authorize_params
        super.tap do |params|
          params[:scope] ||= DEFAULT_SCOPE
        end
      end

      private
        def load_identity
          access_token.options[:mode] = :query
          access_token.options[:param_name] = :access_token
          access_token.options[:grant_type] = :authorization_code
          access_token.get('/api/v1/userinfo').parsed
        end
    end
  end
end

OmniAuth.config.add_camelization 'boletosimples', 'BoletoSimples'
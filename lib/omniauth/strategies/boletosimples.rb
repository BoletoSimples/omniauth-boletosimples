# frozen_string_literal: true

require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class BoletoSimples < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = 'profile'
      ENVIRONMENTS = {
        development: 'http://localhost:5000',
        sandbox: 'https://sandbox.boletosimples.com.br',
        production: 'https://boletosimples.com.br'
      }.freeze
      option :name, 'boletosimples'
      option :client_options,
             token_url: '/api/v1/oauth2/token',
             setup: true

      option :authorize_options, %i[scope response_type]
      option :provider_ignores_state, true
      option :environment, :production

      uid { raw_info['id'] }

      info do
        {
          person_type: raw_info['person_type'],
          first_name: raw_info['first_name'],
          middle_name: raw_info['middle_name'],
          last_name: raw_info['last_name'],
          full_name: raw_info['full_name'],
          date_of_birth: raw_info['date_of_birth'],
          email: raw_info['email'],
          cpf: raw_info['cpf'],
          mother_name: raw_info['mother_name'],
          father_name: raw_info['father_name'],
          sex: raw_info['sex']
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
          business_legal_name: raw_info['business_legal_name'],
          business_name: raw_info['business_name'],
          business_cnpj: raw_info['business_cnpj']
        }
      end

      def setup_phase
        environment = options.environment || :production
        options.client_options[:site] = ENVIRONMENTS[environment.to_sym]
        options.client_options[:authorize_url] = "#{ENVIRONMENTS[environment.to_sym]}/api/v1/oauth2/authorize"

        return unless options.user_agent

        options.client_options[:connection_opts] = {
          headers: {
            'User-Agent' => options.user_agent
          }
        }
      end

      def raw_info
        @raw_info ||= load_identity
      end

      def callback_url
        options[:redirect_uri] || (full_host + script_name + callback_path)
      end

      def authorize_params
        super.tap do |params|
          params[:scope] ||= DEFAULT_SCOPE
        end
      end

      private

      def load_identity
        access_token.get('/api/v1/userinfo').parsed
      end
    end
  end
end

OmniAuth.config.add_camelization 'boletosimples', 'BoletoSimples'

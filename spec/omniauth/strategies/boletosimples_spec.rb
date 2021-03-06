# frozen_string_literal: true

require 'spec_helper'
require 'omniauth-boletosimples'

describe OmniAuth::Strategies::BoletoSimples do
  subject do
    OmniAuth::Strategies::BoletoSimples.new(nil, @options || {})
  end

  it_should_behave_like 'an oauth2 strategy'

  it 'has correct BoletoSimples site' do
    subject.setup_phase
    expect(subject.client.site).to eq('https://boletosimples.com.br')
  end

  it 'has correct BoletoSimples sandbox site' do
    @options = { environment: :sandbox }
    subject.setup_phase
    expect(subject.client.site).to eq('https://sandbox.boletosimples.com.br')
  end

  it 'has correct authorize url' do
    subject.setup_phase
    expect(subject.client.options[:authorize_url]).to eq('https://boletosimples.com.br/api/v1/oauth2/authorize')
  end

  it 'has correct sandbox authorize url' do
    @options = { environment: :sandbox }
    subject.setup_phase
    expect(subject.client.options[:authorize_url]).to eq('https://sandbox.boletosimples.com.br/api/v1/oauth2/authorize')
  end

  it 'has correct token url' do
    expect(subject.client.options[:token_url]).to eq('/api/v1/oauth2/token')
  end

  it 'has correct connection_opts' do
    @options = { user_agent: 'email@example.com' }
    subject.setup_phase
    expect(subject.client.options[:connection_opts]).to eq(headers: { "User-Agent": 'email@example.com' })
  end

  describe '#callback_url' do
    let(:base_url) { 'https://example.com' }

    it 'has the correct default callback path' do
      allow(subject).to receive(:full_host) { base_url }
      allow(subject).to receive(:script_name) { '' }
      expect(subject.send(:callback_url)).to eq("#{base_url}/auth/boletosimples/callback")
    end

    it 'should set the callback path with script_name if present' do
      allow(subject).to receive(:full_host) { base_url }
      allow(subject).to receive(:script_name) { '/v1' }
      expect(subject.send(:callback_url)).to eq("#{base_url}/v1/v1/auth/boletosimples/callback")
    end

    it 'should set the callback_path parameter if present' do
      @options = { callback_path: '/auth/foo/callback' }
      allow(subject).to receive(:full_host) { base_url }
      allow(subject).to receive(:script_name) { '' }
      expect(subject.send(:callback_url)).to eq("#{base_url}/auth/foo/callback")
    end
  end
end

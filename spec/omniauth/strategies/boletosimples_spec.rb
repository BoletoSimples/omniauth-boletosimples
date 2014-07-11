require 'spec_helper'
require 'omniauth-boletosimples'

describe OmniAuth::Strategies::BoletoSimples do
  subject do
    OmniAuth::Strategies::BoletoSimples.new(nil, @options || {})
  end

  it_should_behave_like 'an oauth2 strategy'

  describe '#client' do
    it 'has correct BoletoSimples site' do
      subject.setup_phase
      expect(subject.client.site).to eq('https://boletosimples.com.br')
    end

    it 'has correct BoletoSimples sandbox site' do
      @options = { :environment => :sandbox }
      subject.setup_phase
      expect(subject.client.site).to eq('https://sandbox.boletosimples.com.br')
    end

    it 'has correct authorize url' do
      subject.setup_phase
      expect(subject.client.options[:authorize_url]).to eq('https://boletosimples.com.br/api/v1/oauth2/authorize')
    end

    it 'has correct sandbox authorize url' do
      @options = { :environment => :sandbox }
      subject.setup_phase
      expect(subject.client.options[:authorize_url]).to eq('https://sandbox.boletosimples.com.br/api/v1/oauth2/authorize')
    end

    it 'has correct token url' do
      expect(subject.client.options[:token_url]).to eq('/api/v1/oauth2/token')
    end

    it 'has correct connection_opts' do
      @options = { :user_agent => 'email@example.com' }
      subject.setup_phase
      expect(subject.client.options[:connection_opts]).to eq({:headers=>{:"User-Agent"=>"email@example.com"}})
    end

  end

  describe '#callback_path' do
    it "has the correct callback path" do
      expect(subject.callback_path).to eq('/auth/boletosimples/callback')
    end
  end

end

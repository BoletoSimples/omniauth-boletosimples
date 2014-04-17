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
      subject.client.site.should eq('https://boletosimples.com.br')
    end

    it 'has correct BoletoSimples sandbox site' do
      @options = { :environment => :sandbox }
      subject.setup_phase
      subject.client.site.should eq('https://sandbox.boletosimples.com.br')
    end

    it 'has correct authorize url' do
      subject.setup_phase
      subject.client.options[:authorize_url].should eq('https://boletosimples.com.br/api/v1/oauth2/authorize')
    end

    it 'has correct sandbox authorize url' do
      @options = { :environment => :sandbox }
      subject.setup_phase
      subject.client.options[:authorize_url].should eq('https://sandbox.boletosimples.com.br/api/v1/oauth2/authorize')
    end

    it 'has correct token url' do
      subject.client.options[:token_url].should eq('/api/v1/oauth2/token')
    end

    it 'has correct connection_opts' do
      @options = { :user_agent => 'email@example.com' }
      subject.setup_phase
      subject.client.options[:connection_opts].should eq({:headers=>{:"User-Agent"=>"email@example.com"}})
    end

  end

  describe '#callback_path' do
    it "has the correct callback path" do
      subject.callback_path.should eq('/auth/boletosimples/callback')
    end
  end

end

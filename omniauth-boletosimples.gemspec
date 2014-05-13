# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/boletosimples/version'

Gem::Specification.new do |s|
  s.name     = 'omniauth-boletosimples'
  s.version  = OmniAuth::BoletoSimples::VERSION
  s.authors  = ['Rafael Lima']
  s.email    = ['contato@rafael.adm.br']
  s.summary  = 'BoletoSimples strategy for OmniAuth'
  s.homepage = 'https://github.com/BoletoSimples/omniauth-boletosimples'
  s.license  = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.1.2'

  s.add_development_dependency 'rspec', '~> 2.14'
  s.add_development_dependency 'rake'
end
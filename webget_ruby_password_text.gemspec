Gem::Specification.new do |s|

  s.name              = "webget_ruby_password_text"
  s.summary           = "WebGet Ruby Gem: Password text generator for strong web-savvy passwords"
  s.version           = "1.2.1"
  s.author            = "WebGet"
  s.email             = "webget@webget.com"
  s.homepage          = "http://webget.com/"
  s.signing_key       = '/home/webget/keys/certs/webget.com.rsa.private.key.and.certificate.pem'
  s.cert_chain        = ['/home/webget/keys/certs/webget.pem']

  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.has_rdoc          = true
  s.files             = ['README.rdoc','LICENSE.txt','lib/webget_ruby_password_text.rb']
  s.test_files        = ['test/webget_ruby_password_text_test.rb']

  s.add_dependency('bcrypt-ruby', '>= 2.0.5')

end

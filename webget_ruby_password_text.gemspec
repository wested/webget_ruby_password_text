Gem::Specification.new do |s|

  s.name              = "webget_ruby_password_text"
  s.summary           = "Generate secure password text generator for strong web-savvy passwords"
  s.version           = "1.2.0"
  s.author            = "WebGet"
  s.email             = "webget@webget.com"
  s.homepage          = "http://webget.com/"
  s.signing_key       = '/home/webget/keys/certs/webget.com.rsa.private.key.and.certificate.pem'
  s.cert_chain        = ['/home/webget/keys/certs/webget.pem']

  s.platform          = Gem::Platform::RUBY
  s.require_path      = 'lib'
  s.has_rdoc          = true
  s.files             = ['lib/webget_ruby_password_text.rb']
  s.test_files        = ['test/unit/webget_ruby_password_text_test.rb']

  s.add_dependency('bcrypt-ruby', '>= 2.0.5')
  s.add_dependency('webget_ruby_secure_random', '>= 1.2.0') # for Ruby 1.8.6

end

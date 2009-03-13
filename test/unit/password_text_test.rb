require 'test/unit'
require 'password_text'

class Testing < Test::Unit::TestCase

 def test_all
  20.times{
   x=PasswordText.new
   assert(x.is_a?(String))
   assert_equal(x.length,PasswordText::COUNT)
   assert(x=~/^[a-z]+$/,"lowercase letters:#{x}")
  }
 end

end





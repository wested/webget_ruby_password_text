require 'test/unit'
require 'password_text'

class PasswordTextTest < Test::Unit::TestCase

  def test_default
    s = PasswordText.new
    assert_equal(12,s.length)
    assert_equal(0,s=~/^[abcdefghjkmnpqrstuvwxyz]{12}$/)
  end

  def test_with_length
    s = PasswordText.new(20)
    assert_equal(20,s.length)
    assert_equal(0,s=~/^[abcdefghjkmnpqrstuvwxyz]{20}$/)
  end

  def test_with_length_and_characters
    s = PasswordText.new(20,['a','b','c'])
    assert_equal(20,s.length)
    assert_equal(0,s=~/^[abc]{20}$/)
  end

  def test_chars
    chars=['a','b','c']
    PasswordText.chars=(chars)
    assert_equal(chars,PasswordText.chars)
    s=PasswordText.new
    assert_equal(0,s=~/^[abc]+$/)
  end

  def test_length
    length=99
    PasswordText.length=(length)
    assert_equal(length,PasswordText.length)
    s=PasswordText.new
    assert_equal(length,s.length)
  end

end





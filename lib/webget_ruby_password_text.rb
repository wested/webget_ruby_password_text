=begin rdoc

= WebGet Ruby Gem: PasswordText class to generate secure random passwords.

Author:: Joel Parker Henderson, joelparkerhenderson@gmail.com
Copyright:: Copyright (c) 2006-2010 Joel Parker Henderson
License:: CreativeCommons License, Non-commercial Share Alike
License:: LGPL, GNU Lesser General Public License

Generates strong yet user-friendly passwords using Ruby's secure random cryptographic functions.

You can change how passwords are created using the optional parameters and the return value is a string, so you can do string methods on it.

The default length is 12 characters, which is sufficiently strong for most web applications. You can make this stronger as needed.

The default character array is optimized for usability and accessibility, to help mobile phone users and people with disabilities: all letters are lowercase and letters that look like numbers (specifically, "i", "l", "o") are not used.

== Method
* new: optional, named parameters are length (integer) and alternate character set (array of characters, which forces the password to contain only characters from the passed array)

== Examples
  pt = PasswordText.new => "avzwbnxremcd"
  pt4 = PasswordText.new(:length => 4) => "avzw"
  pt4a = PasswordText.new(:length => 4, :chars => ['x','y','z']) => "yzyx"

== SecureRandom

Ruby 1.8.6 and older does not include a secure random number method so this gem checks to see if the SecureRandom class is defined and, if not, requires the webget_ruby_secure_random gem (http://github.com/webget/webget_ruby_secure_random).

=end


if !defined?(SecureRandom) then require 'webget_ruby_secure_random' end

  # WebGet Ruby Gem: PasswordText class to generate secure random passwords.
  # 
  # Ruby 1.8.6 and older does not include a secure random number method so this gem checks to see if the SecureRandom class is defined and, if not, requires the webget_ruby_secure_random gem (http://github.com/webget/webget_ruby_secure_random).
class PasswordText < String


 # Default characters
 @@chars=['a','b','c','d','e','f','g','h','j','k','m','n','p','q','r','s','t','u','v','w','x','y','z']

 # Default length
 @@length=12


 # Return a new secure random password.
 #
 # The password has a given length (or the default)
 # and is picked from a given character array (or the default).
 #
 # To set the default length, see #length.
 #
 # To set the default character array, see #chars.
 # @param [Hash] opts options used to generate a password
 # @option opts [Integer] :length (12) to override class value for length of generated password
 # @option opts [Array] :chars (@@chars) to override class value for set of characters usable in generated password
 # @example
 #   PasswordText.new => "avzwbnxremcd"
 #   PasswordText.new(4) => "avzw"
 #   PasswordText.new(4,["x","y","z"]) => "yzyx"

 def initialize(opts={})
   @@length ||= opts[:length]
   @@chars ||= opts[:chars]
   super(Array.new(length){chars[SecureRandom.random_number(chars.size)]}.join)
 end

 # Get the default character array.
 #
 # To improve usability, the passwords only use lowercase letters.
 # This helps people who use mobile phones and also helps people
 # who have some kinds disabilities related to manual dexterity.
 # We also omit letters that may be confused with numbers: "i", "l", "o".
 #
 # We choose this as a valuable tradeoff between usability and complexity.
 # 
 # @return [Array] valid characters

 def self.chars
  @@chars
 end


 # Set the default character array
 # 
 # @return [Array] valid characters
 # @param [Array] chars to use for generating passwords
 # @example
 #  PasswordText.chars = ["x","y","z"]

 def self.chars=(chars)
  @@chars=chars
 end


 # Get the default length
 #
 # We choose 12 characters to make a sufficiently strong password.
 # for usual web applications. You can make this stronger as needed.
 # 
 # @return [Integer] default password length

 def self.length
  @@length||=12
 end


 # Set the default length
 # 
 # @return [Integer] default password length
 # @param [Integer] length to use as length of generated passwords
 # @example
 #  PasswordText.length=16

 def self.length=(length)
  @@length=length
 end

end

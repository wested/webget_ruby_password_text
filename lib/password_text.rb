# WebGet.com Ruby PasswordText class to generate secure random passwords.
#
# Password tool to create strong user-friendly passwords,
# using Ruby's secure random cryptographic functions.
#
# ==Examples
#   PasswordText.new => "avzwbnxremcd"
#   PasswordText.new(4) => "avzw"
#   PasswordText.new(4,['x','y','z']) => "yzyx"
#
# PasswordText is a string, so you can do string methods on it.
# You can change how passwords are randomly created however you want.
#
# The default length is 12 to make a sufficiently strong password.
# for usual web applications. You can make this stronger as needed.
# 
# The default character array is chosen for the best usability,
# to help people who use mobile phones and who have disabilities:
# all lowercase and omitting "i", "l", "o" which look like numbers.
#
# If SecureRandom is not defined, e.g. if you are using Ruby 1.8.6,
# then we require our webget_ruby_secure_random gem which provides it.
# Author:: Joel Parker Henderson, joelparkerhenderson@gmail.com
# Copyright:: Copyright (c) 2006-2009 Joel Parker Henderson
# License:: CreativeCommons License, Non-commercial Share Alike
# License:: LGPL, GNU Lesser General Public License

class PasswordText < String

 if !defined?(SecureRandom) then require 'secure_random' end

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
 # To set the default character array, see #chars
 #
 # ==Examples
 #   PasswordText.new => "avzwbnxremcd"
 #   PasswordText.new(4) => "avzw"
 #   PasswordText.new(4,['x','y','z']) => "yzyx"
  
 def initialize(length=@@length,chars=@@chars)
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

 def self.chars
  @@chars
 end


 # Set the default character array

 def self.chars=(chars)
  @@chars=chars
 end


 # Get the default length
 #
 # We choose 12 characters to make a sufficiently strong password.
 # for usual web applications. You can make this stronger as needed.

 def self.length
  @@length||=12
 end


 # Set the default length

 def self.length=(length)
  @@length=length
 end

end



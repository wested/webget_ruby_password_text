# = WebGet.com Ruby PasswordText class to generate secure random passwords.
#
# Author:: Joel Parker Henderson, joelparkerhenderson@gmail.com
# Copyright:: Copyright (c) 2006-2009 Joel Parker Henderson
# License:: CreativeCommons License, Non-commercial Share Alike
# License:: LGPL, GNU Lesser General Public License
#
# Password tool to create strong user-friendly passwords,
# using Ruby's secure random cryptographic functions.
#
# Example:
#   require 'rubygem_secure_password_text'
#   SecurePasswordText.new => "avzwbnxrem"
#
# ScurePasswordText is a string, so you can do string methods on it.
# You can change how passwords are randomly created however you want.
#
# We choose 10 characters to make a sufficiently strong password.
# for usual web applications. You can make this stronger as needed.
# 
# We know users are confused by upper/lower case so we use only lowercase,
# and by letters vs. numbers like "oh" and "zero" so we use only letters.
#
# We choose this as a valuable tradeoff between usability and complexity.
# We also choose this because it is much better for users on smartphones.
##

# Ruby 1.8.6 and older does not have a secure random_number method,
# so we require our ruby_securerandom gem which provides the method.
if !defined?(SecureRandom) then require 'secure_random' end


class PasswordText < String

 COUNT = 10
 CHARS = ['a','b','c','d','e','f','g','h','j','k','m','n','p','r','s','t','u','v','w','x','y','z']

 def initialize
  super(Array.new(COUNT){CHARS[SecureRandom.random_number(CHARS.size)]}.join)
 end

end

require "uri"
require "pry"

email = %{Here is a text of my email.
      I might have some links like http://google.com
      or maybe with parameters http://3scale.net?signup_origin=abc
      Cheers}

=begin
text = URI.extract(email)
puts text
=end
=begin

def replace_links_with_html(email)
  text = URI.extract(email)
  puts text
end

puts replace_links_with_html(email)
=end

def replace_links_with_html(email)
  #binding.pry
  text = URI.extract(email)
=begin
  #puts text
  text_in_str = text.to_s

  #p text.length
  p text.slice(0)
  p text.slice(1)

  email1 = text.slice(0)
  email2 = text.slice(1)

  #p text_in_str.length
  #p text_in_str.slice(4)
  #p text_in_str
=end

=begin
  p email.sub!(email1, 'dupa')
  p email.sub!(email2, 'dupa2')
=end

  email1 = text.slice(0)
  email2 = text.slice(1)

=begin
  email_after_1st_sub = email.sub(email1, 'dupa')
  email_after_2nd_sub = email_after_1st_sub.sub(email2, 'dupa2')

  p email_after_2nd_sub
=end

  #p email1.sub(email1, "<a href='#{email1}' />")
  email_after_1st_sub = email.sub(email1, "<a href='#{email1}' />")
  email_after_2nd_sub = email_after_1st_sub.sub(email2, "<a href='#{email2}' />")

  #p email_after_2nd_sub

end

puts replace_links_with_html(email)



require 'uri'
require 'pry'

text = %{Here is a text of my email.
      I might have some links like http://google.com
      or maybe with parameters http://3scale.net?signup_origin=abc
      Cheers}

def replace_links_with_html(text)

  urls = URI.extract(text)

  urls.each do |url|
    text = text.sub(url, "<a href='#{url}'>#{url}</a>")
  end

  text
end

if __FILE__ == $0

  require 'minitest/autorun'
  class ActivityTest < Minitest::Test

    def test_one
      assert_equal %q{Some <a href='http://google.com'>http://google.com</a> text},
                   replace_links_with_html('Some http://google.com text')
    end

    #test -  "bla bla http://dupa bla bla"
    def test_text_with_incomplete_link
      assert_equal %q{sth sth sth <a href='http://duzadupa'>http://duzadupa</a> sth sth},
                    replace_links_with_html('sth sth sth http://duzadupa sth sth')
    end

  #text without links
    def test_text_without_links
      assert_equal %{sth sth sth sth},
                    replace_links_with_html('sth sth sth sth')
    end

    def test_text_with_two_links
      assert_equal %{Some <a href='http://google.com'>http://google.com</a> text <a href='http://3scale.net'>http://3scale.net</a> text2},
                    replace_links_with_html('Some http://google.com text http://3scale.net text2')
    end

  #text that is whole big link

  end
end

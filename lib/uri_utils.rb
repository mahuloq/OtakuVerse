require 'cgi'

module URIUtils
  extend self

  def decode_uri(uri)
    current_uri = uri
    loop do
      uri = CGI.unescape(uri)
      break if uri == current_uri
      current_uri = uri
    end
    uri
  end
end
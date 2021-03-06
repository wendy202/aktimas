require 'sinatra'
require 'mandrill'

get '/' do
	erb :home
end

get '/about' do
	erb :about
end

get '/testimony' do
	erb :testimony
end

get '/contact_us' do 
	erb :contact_us
end


post '/contact' do
	# puts "my params are:" + params.inspect
	contact_name= params["name"]
	contact_email = params["email"]
	email_body="We received your message"
	m = Mandrill::API.new
	message = {  
	 :subject=> "Thanks for your email!",  
	 :from_name=> "Nick",  
	 :text=>email_body,  
	 :to=>[  
	   {  
	     :email=> contact_email,  
	     :name=> contact_name  
	   }  
	 ],  
	 :html=>"<html><h1>Hi <strong>#{email_body}</strong>, how are you?</h1></html>",  
	 :from_email=>"nicholas_donias@alumni.brown.com"  
	}  
	sending = m.messages.send message 
	puts sending
	redirect to ('/thanks')
end

get '/thanks' do 
	erb :thanks
end
require 'byebug'
get '/' do
  puts "[LOG] get /"
  erb :"static/index"

end

post '/urls' do
	long_url = params[:long_url]
	short_url = Url.shorten
	@url = Url.new(long_url: long_url, short_url: short_url)
	@url.save
	redirect '/urls'
end

get '/urls' do
	@url = Url.last
	erb :"static/urls"
end

get '/:short_url' do
	a = Url.find_by short_url: params[:short_url]
	a.click_count = a.click_count + 1
	a.save
	link = a.long_url
	redirect link
end

post '/back' do
	redirect '/'
end


# a get request is the request to access the page at /... 
# .erb on the end of url allows to write ruby inside of html file (embedded ruby)
# sinatra is always hosted on 9393
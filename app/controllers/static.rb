require 'byebug'

get '/' do
  erb :"static/index"
end

post '/urls' do
	long_url = params[:long_url]
	# short_url = Url.shorten
	@url = Url.new(long_url: long_url)
	if @url.save
		"<div class='mainbox'>
			<a href = '/#{@url.short_url}''>
				localhost:9393\/#{@url.short_url}
			</a>
		</div>"

	else
		"<div class='mainbox'>
		<p>Error, please enter a correct URL</p>
		</div>"
	end
end

get '/stats' do 
	@url = Url.all.order(:created_at)
	erb :"static/stats"
end

get '/about' do 
	erb :"static/about"
end

get '/contact' do 
	erb :"static/contact"
end

post '/contact' do
	"<p>#{params[:name]}</p>"
end

get '/urls' do
	@url = Url.last
	erb :"static/urls"
end

get '/error' do
	erb :"static/error"
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
class HomeController < ApplicationController
	def index
		@feeds = Feed.last(5)
	end
end

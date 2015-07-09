class SearchController < ApplicationController
	def index
		@entries = Entry.fuzzy_search({lname: params[:q], fname: params[:q]}, false)(:all)
  	end
end

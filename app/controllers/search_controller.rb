class SearchController < ApplicationController
	def index
		@entries = Entry.fuzzy_search({lname: params[:q], fname: params[:q]}, false).paginate(:page => params[:page], :per_page => 5)
  	end
end
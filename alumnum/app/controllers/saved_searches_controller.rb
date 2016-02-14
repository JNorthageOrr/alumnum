class SavedSearchesController < ApplicationController

	def search #get#search
		if params[:q]== ""
			query = "blank"
		else
			query = params[:q].downcase
		end
		
		@found = SavedSearch.find_by(:query => query)
		if @found
			@found.count +=1
			@found.save
		else
			@saved_search = SavedSearch.new(query: query)
			@saved_search.save
		end
		

		@history = SavedSearch.order(count: :desc)
	end

	def history
		@history = SavedSearch.order(count: :desc)
	end

end

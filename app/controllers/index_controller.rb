class IndexController < ApplicationController
	def index
		@rows = Test.find_all
	end
end

class StaticPagesController < ApplicationController
	skip_before_action :auth, only: [:about, :contact]
  def about
  end

  def contact
  end
end

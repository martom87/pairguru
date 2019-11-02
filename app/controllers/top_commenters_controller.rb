class TopCommentersController < ApplicationController
  def index
    @top_commenters = TopCommenters::CommentersQuery.new(days_amount: 7).find_top_commenters(amount: 10)
  end
end

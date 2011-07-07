class ScrapeController < ApplicationController
  def index
  end

  def run_scrape
    Notetaker.last.nil? ? last_id = 50 : last_id = Notetaker.last.n_id
    Nonmerchant.last.nil? ? last_nm_id = 0 : last_nm_id = Nonmerchant.last.n_id
    if last_id.to_i < last_nm_id.to_i
      last_id = last_nm_id
    end
    start_r = last_id.to_i + 1
    stop_r = last_id.to_i + params[:i].to_i
    r = (start_r..stop_r)
    puts r
    Notetaker.scrape_user_info(r)
    redirect_to '/notetakers'
  end
end

class Notetaker < ActiveRecord::Base
  has_many :notes

  def self.scrape_user_info(r, n)
    
    #logs you in to notehall
    a = Mechanize.new
    a.get('http://www.notehall.com/') do |page|

      # Submit the login form
      my_page = page.form_with(:action => 'https://www.notehall.com/index/login') do |f|
        f.username  = 'bderusha@brandeis.edu'
        f.password  = 'Not@ppl3'
      end.submit
    end

    logged_in = a.current_page.parser.to_s =~ /Welcome Brandeis/
    return if logged_in.nil?

    for i in r do
      sleep n
      merch = true
      notetaker = Notetaker.find_by_n_id(i)
      nonmerch = Nonmerchant.find_by_n_id(i)
      if (notetaker.nil? && nonmerch.nil?)
        url = 'http://www.notehall.com/user/profile/id/'+i.to_s
        a.get(url) do |page|
          merchant_acct = page.link_with(:href=> url[23..-1])
          if merchant_acct.nil?
            Nonmerchant.create!(:n_id => i)
            merch = false
          else
            @page = page.parser
          end
        end
        if merch
          scraper = Scraper.define do
            process "a.merchant-link", :user_name => :text, :url => '@href'
            process "a.merchant-link>span", :sales => "@class"
            result :user_name, :url , :sales
          end

          page_scrape = scraper.scrape(@page.to_s)
          sales_level = page_scrape.sales
          if sales_level.nil?
            sales_level = 'less than 10'
          end
          Notetaker.create!(:n_id => i, :n_username => page_scrape.user_name, :n_url => page_scrape.url, :n_sales => sales_level)
        end
      end
    end
  end
end

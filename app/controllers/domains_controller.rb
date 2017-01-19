class DomainsController < ApplicationController
  def index
    Domain.delete_all

    list = ['http://www.google.com/', 'http://www.yahoo.com/', 'http://www.bing.com']
    
    list.each do |site_url|
      url = site_url
      file_path = "#{url.gsub(/[^0-9a-zA-Z]+/, '')}.png"
      domain = Domain.new(url: url, file_path: file_path)
      domain.save
      
      ws = Webshot::Screenshot.instance
      ws.capture domain.url, Rails.root.join('public','images', 'domains', "#{file_path}"),
        width: 500, height: 400, quality: 80, timeout: 30
      domain.status_code = ws.send(:page).status_code
      domain.save
      
      @domains = Domain.all
    end
  end
end

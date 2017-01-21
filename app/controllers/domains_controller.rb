class DomainsController < ApplicationController
  def index
    DomainImporter.new.import_domains
    
    Domain.all.each do |domain|
      url = domain.url
      domain.file_path = "#{url.gsub(/[^0-9a-zA-Z]+/, '')}.png"
      domain.save
      
      ws = Webshot::Screenshot.instance
      ws.capture domain.url, Rails.root.join('public','images', 'domains', "#{domain.file_path}"),
        width: 500, height: 400, quality: 80, timeout: 30
      domain.status_code = ws.send(:page).status_code
      domain.save
    end


    @domains = Domain.all
  end
end

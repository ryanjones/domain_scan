require 'csv'

class DomainImporter
  include ActiveModel::AttributeMethods
  
  def import_domains
    csv_text = File.read(Rails.root.join('lib','data', 'test_data.csv'))
    csv = CSV.parse(csv_text, headers: false)
    csv.each do |row|
      row.each do |url|
        Domain.find_or_create_by(url: url)
      end
    end
  end
end
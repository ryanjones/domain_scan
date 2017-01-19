class CreateDomains < ActiveRecord::Migration[5.0]
  def change
    create_table :domains do |t|
      t.string :status_code
      t.string :url
      t.string :file_path

      t.timestamps
    end
  end
end

class CreateScrapperResults < ActiveRecord::Migration
  def change
    create_table :scrapper_results do |t|
      t.string :title
      t.string :date
      t.string :link

      t.timestamps null: false
    end
  end
end

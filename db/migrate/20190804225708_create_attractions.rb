class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.integer :tickets
      t.string :name
      t.integer :nausea_rating
      t.integer :happiness_rating
      t.integer :min_height
    end
  end
end

class CreateCategoryGifs < ActiveRecord::Migration[5.1]
  def change
    create_table :category_gifs do |t|
      t.references :category, index: true, foreign_key: true
      t.references :gif, index: true, foreign_key: true

      t.timestamps
    end
  end
end

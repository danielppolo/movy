class CreateBikes < ActiveRecord::Migration[5.1]
  def change
    create_table :bikes do |t|
      t.string :make
      t.string :model
      t.text :description
      t.integer :year
      t.string :category
      t.integer :cc
      t.float :consuption
      t.float :consuptiom
      t.integer :rate
      t.references :user, foreign_key: true
      t.string :photo
      t.string :location

      t.timestamps
    end
  end
end

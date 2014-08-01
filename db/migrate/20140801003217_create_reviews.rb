class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :title
      t.string :description
      t.integer :stars

      t.timestamps
    end
  end
end

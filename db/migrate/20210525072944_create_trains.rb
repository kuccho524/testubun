class CreateTrains < ActiveRecord::Migration[5.2]
  def change
    create_table :trains do |t|
      t.string :title
      t.text :body
      t.string :train_image_id
      t.integer :user_id

      t.timestamps
    end
  end
end

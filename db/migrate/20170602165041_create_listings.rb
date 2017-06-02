class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.float :price
      t.text :description
      t.string :address
      t.integer :user_id
      t.boolean :availability
      t.boolean :free_wifi
      t.boolean :heated_floors
      t.boolean :toiletries

      t.timestamps

    end
  end
end

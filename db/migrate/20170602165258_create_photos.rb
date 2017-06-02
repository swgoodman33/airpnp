class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :image_url
      t.integer :listing_id

      t.timestamps

    end
  end
end

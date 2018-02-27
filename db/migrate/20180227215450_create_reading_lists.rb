class CreateReadingLists < ActiveRecord::Migration[5.1]
  def change
    create_table :reading_lists do |t|
      t.text :name
      t.integer :user_id

      t.timestamps
    end
  end
end

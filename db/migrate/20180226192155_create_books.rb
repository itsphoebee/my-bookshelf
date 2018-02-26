class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.text :title
      t.integer :user_id
      t.integer :publication_year
      t.integer :genre_id
      t.text :blurb

      t.timestamps
    end
  end
end

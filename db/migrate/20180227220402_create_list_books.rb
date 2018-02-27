class CreateListBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :list_books do |t|
      t.integer :book_id
      t.integer :reading_list_id

      t.timestamps
    end
  end
end

class ChangeUserToAuthorOnBooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :user_id
    add_column :books, :author, :string
  end
end

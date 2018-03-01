require 'pry'
class ReadingList < ApplicationRecord
  belongs_to :user
  has_many :list_books
  has_many :books, through: :list_books

  validates :name, presence: true
  validates :name, uniqueness: {scope: :user_id}

  def book_ids=(ids)
    ids.each do |id|
      book = Book.find_by(id)
      if !self.books.include?(book)
      self.books << book
      end
    end
  end

end

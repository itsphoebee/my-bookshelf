class Author < ApplicationRecord
  has_many :books
  has_many :genres, through: :books

  validates :name, presence: true

  accepts_nested_attributes_for :books

  def books_attributes=(books_attributes)
    books_attributes.values.each do |book_attribute|
      if !book_attribute[:title].empty?
        new_book = Book.find_or_create_by(book_attribute)
        self.books << new_book
      end
    end
  end

  def self.most_hardworking
    self.joins(:books).select("authors.*, count(books.id) as scount").group("authors.id").order("scount DESC").first
  end
  
end

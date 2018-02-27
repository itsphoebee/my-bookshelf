class Book < ApplicationRecord
  belongs_to :genre
  belongs_to :author
  #has_many :booklists
  #has_many :books, through: :booklists
  validates :title, presence: true
  validates :title, uniqueness: {scope: :author_id}
end

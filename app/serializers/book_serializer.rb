class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :publication_year
  belongs_to :author
end

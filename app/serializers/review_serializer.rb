class ReviewSerializer < ActiveModel::Serializer
  attributes :content, :id, :user
  belongs_to :book
  belongs_to :user
end

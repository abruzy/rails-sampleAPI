class PostSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_many :comments
end

# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  content           :string           not null
#  author_id         :integer          not null
#  post_id           :integer          not null
#  parent_comment_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Comment < ActiveRecord::Base
  validates :content, :author_id, :post_id, presence: true

  belongs_to :post

  belongs_to :parent_comment,
    class_name: :Comment

  has_many :children,
    class_name: :Comment,
    primary_key: :id,
    foreign_key: :parent_comment_id

  belongs_to :author,
    class_name: :User
end

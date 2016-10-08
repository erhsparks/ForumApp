# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :title, :author_id, presence: true

  has_many :post_subs

  has_many :subs, through: :post_subs, source: :sub

  has_one :moderator, through: :sub

  has_many :comments

  belongs_to :author,
    class_name: :User
end

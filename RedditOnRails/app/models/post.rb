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
  has_many :post_subs

  has_many :subs, through: :post_subs, source: :sub

  has_one :moderator, through: :sub

  belongs_to :author,
    class_name: :User
end

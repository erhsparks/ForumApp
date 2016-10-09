# == Schema Information
#
# Table name: post_subs
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostSub < ActiveRecord::Base
  validates :post, :sub, presence: true

  belongs_to :post, inverse_of: :post_subs

  belongs_to :sub, inverse_of: :post_subs
end

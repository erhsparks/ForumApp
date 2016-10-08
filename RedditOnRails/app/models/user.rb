# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  session_token   :string
#

class User < ActiveRecord::Base
  has_many :subs,
    foreign_key: :moderator_id,
    inverse_of: :moderator

  has_many :posts,
    foreign_key: :author_id,
    inverse_of: :author

  has_many :moderated_posts, through: :subs, source: :posts

  has_many :comments,
    foreign_key: :author_id,
    inverse_of: :author

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6 , allow_nil: true }

  attr_reader :password

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(user_params)
    user = User.find_by_username(user_params[:username])
    return ["User not found"] unless user
    if user.is_password?(user_params[:password])
      user
    else
      ["Password incorrect"]
    end
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!

    self.session_token
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end

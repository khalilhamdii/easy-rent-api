class User < ApplicationRecord
  has_secure_password
  validates :userName, presence: true, length: { minimum: 4 }
  validates :email, presence: true, uniqueness: true
  def as_json(options = {})
    super(options.merge({ except: [:password_digest] }))
  end
end

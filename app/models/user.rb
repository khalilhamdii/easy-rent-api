class User < ApplicationRecord
  has_secure_password
  validates :userName, presence: true, length: { minimum: 4 }
  validates :email, presence: true, uniqueness: true
  def as_json(options = {})
    super(options.merge({ except: %i[password_digest email] }))
  end
end

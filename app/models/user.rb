class User < ApplicationRecord
  has_secure_password
  validates :userName, presence: true, length: { minimum: 4 }
  validates :email, presence: true, uniqueness: true
  validates_format_of :email,
                      with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/

  has_many :rents, dependent: :destroy
  def as_json(options = {})
    super(options.merge({ except: %i[password_digest email created_at updated_at] }))
  end
end

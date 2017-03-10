class User < ApplicationRecord
  has_secure_password
  before_validation :downcase_email
  validates_uniqueness_of :email
  validates_format_of :email, with: /@/
  validates :password, length: { minimum: 8 }, allow_nil: true

  private
    def downcase_email
      self.email = email.downcase
    end
end

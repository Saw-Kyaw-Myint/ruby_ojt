class Friend < ApplicationRecord
 belongs_to :user
 validates :first_name, presence:  { message: "First Name cannot be empty" }
 validates :last_name, presence:  { message: "Last Name cannot be empty" }
 validate :validate_email_format
 validates :phone,
  format: { with: /\A09\d{9}\z/,
  message: "Invalid Phone number" }, unless: -> { phone.blank? }

 private

 def validate_email_format
   if email.present? && !email.match?(URI::MailTo::EMAIL_REGEXP)
     errors.add(:email, "Invalid Email format")
    elsif email.blank?
      errors.add(:email, "Email can't be empty")
    end
end
end

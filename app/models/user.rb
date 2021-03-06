class User < ApplicationRecord

  validates :email,
  presence: true,
  uniqueness: {case_sesitive: false}

  validates :password,
  length: {in: 6..25},
  on: :create

  has_secure_password

  def self.authenticate(params)
    User.find_by_email(params[:email]).try(:authenticate, params[:password]);
  end
end

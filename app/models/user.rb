class User < ActiveRecord::Base
  has_secure_password

  has_many :projects, dependent: :nullify
  has_many :tasks, dependent: :nullify

  has_many :favourites, dependent: :destroy
  has_many :favourited_projects, through: :favourites, source: :project


  validates :first_name, presence: true, length: {maximum: 50}
  validates :last_name, presence: true, length: {maximum: 50}

  validates :email, presence: true, length: {maximum: 255}, uniqueness: {case_sensitive: false}, format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :password, presence: true, length: {minimum: 6}


  def full_name
    "#{first_name} #{last_name}"
  end

end

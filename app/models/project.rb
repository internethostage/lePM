class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy

  has_many :favourites, dependent: :destroy
  has_many :users, through: :likes

# This validation ensures that there is a title added and that it doesn't already exist
# validates :title, {presence: {message: "can't be blank!"}, uniqueness: {message: "already exists, please try a different one!"}}
validates :title, {presence: {message: "can't be blank"}, uniqueness: {message: "already exists, please try a different one!"}}
validates :due_date, presence: true
validates :description, presence: true
validate :in_the_future

  def favourited_by?(user)
    favourites.find_by_user_id(user.id).present?
  end

  def favourites_for(user)
    favourites.find_by_user_id user if user
  end

private


  def in_the_future
    if due_date && due_date <= Date.today
      errors.add(:due_date, "must be greater than today")
    end
  end




end

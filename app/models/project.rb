class Project < ActiveRecord::Base

  has_many :tasks, dependent: :destroy

# This validation ensures that there is a title added and that it doesn't already exist
# validates :title, {presence: {message: "can't be blank!"}, uniqueness: {message: "already exists, please try a different one!"}}
validates :title, {presence: {message: "can't be blank!"}, uniqueness: {message: "already exists, please try a different one!"}}
validate :in_the_future

private


  def in_the_future
    if due_date <= Date.today
      errors.add(:due_date, "must be greater than today")
    end
  end


end

class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

validates :title, {presence: {message: "can't be blank!"}, uniqueness: {message: "already exists, please try a different one!"}}
validates :due_date, presence: true
validate :in_the_future

private


  def in_the_future
    if due_date && due_date <= Date.today
      errors.add(:due_date, "must be greater than today")
    end
  end

end

class Task < ActiveRecord::Base
  belongs_to :project

validates :title, {presence: {message: "can't be blank!"}, uniqueness: {message: "already exists, please try a different one!"}}


end

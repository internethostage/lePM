class Task < ActiveRecord::Base

validates :title, {presence: {message: "can't be blank!"}, uniqueness: {message: "already exists, please try a different one!"}}


end

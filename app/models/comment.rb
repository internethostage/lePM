class Comment < ActiveRecord::Base

validates :body, {presence: {message: "can't be blank!"}}

end

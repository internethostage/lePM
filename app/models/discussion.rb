class Discussion < ActiveRecord::Base

validates :title, {presence: {message: "can't be blank!"}}

end

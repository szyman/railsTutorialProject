class User < ActiveRecord::Base
  attr_accessible :login, :email
  has_many :posts, dependent: :destroy
end

class Share < ActiveRecord::Base
  attr_accessible :email, :title, :description

  has_many :uploads

  validates :email, :presence => true,
                    :format   => /\A[\w+-.]+@[a-z\d\-.]+\.[a-z]+\z/i
end

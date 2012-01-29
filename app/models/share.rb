class Share < ActiveRecord::Base
  attr_accessible :email, :title, :description, :access_key

  before_create :generate_access_key

  has_many :uploads

  validates :email, :presence => true,
                    :format   => /\A[\w+-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  private

  def generate_access_key
    self.access_key = SecureRandom.base64(18).gsub(/\+/,"-").gsub(/\//,"_")
  end
end

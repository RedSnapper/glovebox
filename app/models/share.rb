class Share < ActiveRecord::Base
  attr_accessible :email, :title, :description

  before_create :generate_access_key
  before_create :generate_view_key

  has_many :uploads, :dependent => :destroy

  validates :email, :presence => true,
                    :format   => /\A[\w+-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  #confirm access key matches the one in the model
  def check_access_key(access_key)
    self.access_key == access_key
  end

  def check_view_key(view_key)
    self.view_key == view_key
  end

  private

  def generate_access_key
    self.access_key = get_random_key
  end

  def generate_view_key
    self.view_key = get_random_key
  end

  def get_random_key
    SecureRandom.base64(18).gsub(/\+/,"-").gsub(/\//,"_")
  end
end

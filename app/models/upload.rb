class Upload < ActiveRecord::Base
  attr_accessible :name, :file, :shortcut

  before_save :generate_shortcut

  belongs_to :share
  mount_uploader :file, FileUploader  

  private
    def generate_shortcut
      # base64 with non-url safe characters substituted out
      # nicer gsub syntax in Ruby 1.9, which accepts a hash. Oh well.
      self.shortcut = SecureRandom.base64(6).gsub(/\+/,"-").gsub(/\//,"_")
    end
end

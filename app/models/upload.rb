class Upload < ActiveRecord::Base
  attr_accessible :name, :file, :shortcut

  belongs_to :share
  mount_uploader :file, FileUploader  
end

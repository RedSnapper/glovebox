class Upload < ActiveRecord::Base
  belongs_to :share
  mount_uploader :file, FileUploader  
end

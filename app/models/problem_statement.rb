class ProblemStatement < ActiveRecord::Base
	
  mount_uploader :attachment, ProblemStatementUploader
  has_many :users 

end

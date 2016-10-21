class Content < ActiveRecord::Base

  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :title, presence: true # Make sure the owner's name is present.
  searchable do
    text :title, :tags, :description
  end    
end

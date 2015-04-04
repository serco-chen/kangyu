class Image < ActiveRecord::Base
  has_attached_file :file
  validates_attachment :file, :presence => true,
    :content_type => { :content_type => /\Aimage\/.*\Z/ },
    :size => { :in => 0..20.megabytes }

  belongs_to :image_owner, polymorphic: true
end

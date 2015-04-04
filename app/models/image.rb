# == Schema Information
#
# Table name: images
#
#  id                :integer          not null, primary key
#  image_owner_id    :integer
#  image_owner_type  :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#

class Image < ActiveRecord::Base
  has_attached_file :file
  validates_attachment :file, :presence => true,
    :content_type => { :content_type => /\Aimage\/.*\Z/ },
    :size => { :in => 0..20.megabytes }

  belongs_to :image_owner, polymorphic: true
end

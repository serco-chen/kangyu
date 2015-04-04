# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base

  has_many :images, as: :image_owner
  accepts_nested_attributes_for :images, allow_destroy: true
end

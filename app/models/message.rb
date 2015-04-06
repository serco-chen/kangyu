# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  name         :string
#  email        :string
#  phone_number :string
#  content      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Message < ActiveRecord::Base
  validates :email, allow_blank: true, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :content, presence: true
end

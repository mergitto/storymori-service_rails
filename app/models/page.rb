# == Schema Information
#
# Table name: pages
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  text       :string(255)
#  story_id   :integer          not null
#  parent_id  :integer
#  created_by :integer
#  updated_by :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Page < ApplicationRecord
  # association
  belongs_to :story

  # validates
  validates :story_id, presence: true

  # scope
  scope :next_page, ->(page_id) { Page.find_by(parent_id: page_id) }

  # methods
end

# == Schema Information
#
# Table name: stories
#
#  id         :bigint           not null, primary key
#  title      :string(255)
#  summary    :string(255)
#  created_by :integer
#  updated_by :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Story < ApplicationRecord
  # association
  has_many :pages

  # validate
  validates :title, length: { maximum: 10 }, presence: true

  # methods
end

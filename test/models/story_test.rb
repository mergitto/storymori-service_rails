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

require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

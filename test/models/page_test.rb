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

require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

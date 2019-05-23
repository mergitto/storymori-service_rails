require 'rails_helper'

RSpec.describe Story, type: :model do
  before do
    @story = create(:story)
  end

  it 'correct data' do
    expect(@story.title).to eq('Story Test 1')
    expect(@story.summary).to eq('Story Test Summary')
  end
end

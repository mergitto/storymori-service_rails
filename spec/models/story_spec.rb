require 'rails_helper'

RSpec.describe Story, type: :model do
  before do
    @story = build(:story)
  end

  it 'correct data' do
    expect(@story.id).to eq(1)
    expect(@story.title).to eq('Story Test 1')
    expect(@story.summary).to eq('Story Test Summary')
  end
end

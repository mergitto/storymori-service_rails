require 'rails_helper'

RSpec.describe Page, type: :model do
  before do
    @page = build(:page)
    @story = build(:story)
  end

  it 'correct data' do
    expect(@page.name).to eq('Hiro')
    expect(@page.text).to eq('Test1')
    expect(@page.story_id).to eq(1)
    expect(@page.parent_id).to eq(nil)
  end

  it "failed save, if isn't exist story" do
    expect(@page.save).to be_falsey
  end

  it 'success save, if exist story' do
    @story.save
    @page.story_id = @story.id
    expect(@page.save).to be_truthy
  end

  it 'next page is current next page' do
    @story.save
    @page.story_id = @story.id
    @page.save
    new_page = Page.create(story_id: @story.id, parent_id: @page.id, name: 'new test', text: 'new test text')
    next_page = Page.next_page(@page.id).first

    expect(next_page.id).to eq(new_page.id)
  end
end

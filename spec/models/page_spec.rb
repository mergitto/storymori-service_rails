require 'rails_helper'

RSpec.describe Page, type: :model do
  before do
    @page = build(:page)
  end

  it "the truth" do
    expect(@page.id).to eq(1)
    expect(@page.name).to eq("Hiro")
    expect(@page.text).to eq("Test1")
    expect(@page.story_id).to eq(1)
    expect(@page.parent_id).to eq(nil)
  end
end

require 'rails_helper'

describe 'as a visitor' do
  it "should see the welcome page" do
    visit root_path

    expect(page).to have_content("If you want to destroy my sweater, pull this thread as I walk away.")
  end
end

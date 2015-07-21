require 'spec_helper'

describe "Pages" do
  describe "Root page" do
    it "should return list of pages" do
      Page.create(name: "Test name", content: "Test content")

      visit '/'
      expect(page).to have_content('Test name')
    end
  end

  describe "Root Add page" do
    it "should show add form" do
      visit '/add'
      expect(page).to have_selector('form')
    end

    it "should save page from form" do
      visit '/add'
      fill_in 'Name', with: 'Test name'
      fill_in 'Title', with: 'Test_title'
      fill_in 'Content', with: 'Test content one two three'
      click_button 'Save Page'

      expect(page).to have_content('Test name')
    end
  end

  describe "View page" do
    it "should show title and content" do
      Page.create(name: 'Test_name', title: 'Test title', content: 'Test content')

      visit '/Test_name'
      expect(page).to have_content('Test title')
      expect(page).to have_content('Test content')
    end
  end
end

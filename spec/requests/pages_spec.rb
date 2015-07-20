require 'spec_helper'

describe "Pages" do
  describe "Root page" do
    it "should return list of pages" do
      Page.create(name: "Test name", content: "Test content")

      visit '/'
      expect(page).to have_content('Test name');
    end
  end
end

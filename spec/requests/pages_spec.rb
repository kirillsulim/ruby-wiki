require 'spec_helper'

describe "Pages" do
  describe "Root page" do
    it "should return list of pages" do
      Page.create(name: "Test_name",
                  full_name: "Test_name",
                  title: 'Test title',
                  content: "Test content")

      visit '/'
      expect(page).to have_content('Test title')
    end

    it "should contains links to pages" do
      Page.create(name: "Test_name",
                  full_name: "Test_name",
                  title: 'Test title',
                  content: 'Test content')

      visit '/'
      click_link('Test title')
      expect(page).to have_content('Test content')
    end
  end

  describe "Root Add page" do
    it "should show add form" do
      visit '/add'
      expect(page).to have_selector('form')
    end

    it "should save page from form" do
      visit '/add'
      fill_in 'Name', with: 'Test_name'
      fill_in 'Title', with: 'Test title'
      fill_in 'Content', with: 'Test content one two three'
      click_button 'Save Page'

      expect(page).to have_content('Test title')
    end

    it "should decline bad name" do
      visit '/add'
      fill_in 'Name', with: '***wrong'
      click_button 'Save Page'

      expect(page).to have_content('Error')
    end

    # TODO: Test Cyrillic
    #it "should support Cyrillic characters in name" do end
  end

  describe "View page" do
    it "should show title and content" do
      Page.create(name: 'Test_name',
                  full_name: 'Test_name',
                  title: 'Test title',
                  content: 'Test content')

      visit '/Test_name'
      expect(page).to have_content('Test title')
      expect(page).to have_content('Test content')
    end
  end

  describe "Edit page" do
    it "should fill edit form with title and content" do
      Page.create(name: 'test',
                  full_name: 'test',
                  title: 'Test title',
                  content: 'Test content')

      visit '/test/edit'
      expect(page).to have_field('Title', with: 'Test title')
      expect(page).to have_field('Content', with: 'Test content')
    end

    it "should save edited values" do
      Page.create(name: 'test',
                  full_name: 'test',
                  title: 'Test title',
                  content: 'Test content')

      visit '/test/edit'
      fill_in 'Title', with: 'Edited title'
      fill_in 'Content', with: 'Edited content'
      click_button 'Save Page'

      page = Page.find_by name: 'test'
      expect(page[:title]).to eq('Edited title')
      expect(page[:content]).to eq('Edited content')
    end
  end

  describe "Add page" do
    it "should create subpage" do
      visit '/add'
      fill_in 'Name', with: 'test'
      fill_in 'Title', with: 'test'
      click_button 'Save Page'

      visit 'test/add'
      fill_in 'Name', with: 'subpage'
      fill_in 'Title', with: 'subpage'
      fill_in 'Content', with: 'subcontent'
      click_button 'Save Page'

      visit '/test'
      click_link 'subpage'

      expect(page).to have_content('subcontent')
    end

    it "should not allow to add subpage to unexisted page" do
      expect{visit '/not/existing/page/add'}.to raise_error(ActionController::RoutingError)
    end
  end

  describe "Decorators" do
    it "should decorate bold content on the fly" do
      Page.create(name: 'n', full_name: 'n', content: "Some **bold** content!")

      visit '/n'
      expect(find("p").find("b")).to have_content("bold")
    end

    it "should decorate italic content on the fly" do
      Page.create(name: 'n', full_name: 'n', content: "Some \\\\italic\\\\ content!")

      visit '/n'
      expect(find("p").find("i")).to have_content("italic")
    end

    it "should decorate link content on the fly" do
      Page.create(name: 'n', full_name: 'n', content: "Some ((l link here))!")
      Page.create(name: 'l', full_name: 'l', content: "You found me!")

      visit '/n'
      click_link("link here")
      expect(page).to have_content("You found me!")
    end
  end
end

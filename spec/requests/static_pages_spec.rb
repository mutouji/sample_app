require 'rails_helper'

=begin
RSpec.describe "StaticPages", type: :request do
  describe "GET /static_pages" do
    it "works! (now write some real specs)" do
      get static_pages_index_path
      expect(response).to have_http_status(200)
    end
  end
end
=end
require 'spec_helper'

describe "Static pages" do
  # let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_content(heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading) { 'Sample App' }
    let(:page_title) { '' }

    # it{ should have_content('Sample App')}
    # it{ should have_title(full_title('')) }

    it_should_behave_like "all static pages"
    it{ should_not have_title('| Home')}


    # it "should have the content 'Sameple App'" do
    #   visit root_path
    #   expect(page).to have_content('Sample App')
    # end
    #
    # it "should have the base title" do
    #   expect(page).to have_title("Ruby on Rails Tutorial Sample App")
    # end
    #
    # it "should not have a custom page title" do
    #   expect(page).not_to have_title(' | Home')
    # end
  end

  describe "Help page" do
    before { visit help_path }

    it{ should have_content('Help')}
    it{ should have_title(full_title('Help')) }
    # it "should have the content 'Help'" do
    #   visit '/static_pages/help'
    #   expect(page).to have_content('Help')
    # end
    #
    # it "should have the right title" do
    #   visit '/static_pages/help'
    #   expect(page).to have_title("#{base_title} | Help")
    # end
  end

  describe "About page" do
    before { visit about_path }

    it{ should have_content('About')}
    it{ should have_title(full_title('About Us')) }
    # it "should have the content 'About Us'" do
    #   visit '/static_pages/about'
    #   expect(page).to have_content('About Us')
    # end
    #
    # it "should have the right title" do
    #   visit '/static_pages/about'
    #   expect(page).to have_title("#{base_title} | About")
    # end
  end

  describe "Contact page" do
    before { visit contact_path }

    it{ should have_content('Contact')}
    it{ should have_title(full_title('Contact')) }
    # it "should have the content 'Contact'" do
    #   visit '/static_pages/contact'
    #   expect(page).to have_content('Contact')
    # end
    #
    # it "should have the title 'Contact'" do
    #   visit '/static_pages/contact'
    #   expect(page).to have_title("#{base_title} | Contact")
    # end
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    click_link "Help"
    expect(page).to have_title(full_title('Help'))
    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))
    click_link "Home"
    expect(page).to have_title(full_title(''))
    click_link "Sign up now!"
    expect(page).to have_title(full_title('Sign up'))
    click_link "sample app"
    expect(page).to have_title(full_title(''))
  end

end

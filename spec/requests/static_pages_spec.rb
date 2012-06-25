require 'spec_helper'

describe "StaticPages" do
  
  subject { page }
  
  shared_examples_for "all static pages" do
    it { should have_selector('h1',     text: heading) }
    it { should have_selector('title',  text: full_title(page_title)) }
  end
  
  describe "Home page" do
    
    before { visit root_path }
    let(:heading)     { 'MusicSoc Band Room Booking System' }
    let(:page_title)  { '' }
    
    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| Home' }
    
  end
  
  describe "FAQ page" do
    
    before { visit faq_path }
    let(:heading)     { 'FAQ' }
    let(:page_title)  { 'FAQ' }
    
    it_should_behave_like "all static pages"
    
  end
  
  describe "About page" do
    
    before { visit about_path }
    let(:heading)     { 'About Us' }
    let(:page_title)  { 'About Us' }
    
    it_should_behave_like "all static pages"
    
  end
  
  describe "Contact page" do
    
    before { visit contact_path }
    let(:heading)     { 'Contact' }
    let(:page_title)  { 'Contact' }
    
    it_should_behave_like "all static pages"
    
  end
  
  it "should have the right links on the layout" do
    
    visit root_path
    
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    
    click_link "FAQ"
    page.should have_selector 'title', text: full_title('FAQ')
    
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    
    click_link "Home"
    click_link "Sign up"
    page.should have_selector 'title', text: full_title('Sign up')
    
    click_link "[musicsoc] band room booking system"
    page.should have_selector 'title', text: full_title('')
    
  end
  
end

describe "the homepage", type: :feature do
    
    it "contains a welcome message" do
        visit '/'
        expect(page).to have_content('Welcome to Chitter!')
    end
    
end
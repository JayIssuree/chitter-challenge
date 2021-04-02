describe "viewing the homepage", type: :feature do
    
    it "displays a welcome message" do
        visit '/chitter'
        expect(page).to have_content("Welcome to Chitter")
    end

end
describe "logging out", type: :feature do
    
    it "successfully logs out the user" do
        User.create(username: 'username', password: 'password123')
        visit('/')
        click_button("Log In")
        fill_in("username", with: "username")
        fill_in("password", with: "password123")
        click_button("Log In")
        expect(page.current_path).to eq('/chitter')
        expect(page).to have_content("Welcome, username")
        click_button("Log Out")
        expect(page).to have_no_content("Welcome, username")
    end

end
describe "signing up", type: :feature do
    
    it "has a button that takes you to the sign up page" do
        visit('/')
        expect(page).to have_button("Sign Up")
    end

    it "has a sign up form" do
        visit('/')
        click_button("Sign Up")
        expect(page.current_path).to eq('/users/new')
        expect(page).to have_field("username")
        expect(page).to have_field("password")
        expect(page).to have_field("password_confirmation")
        expect(page).to have_button("Create Account")
    end

    it "successfully creates the account and displays their name on the homepage" do
        visit('/')
        click_button("Sign Up")
        fill_in("username", with: "username")
        fill_in("password", with: "password123")
        fill_in("password_confirmation", with: "password123")
        click_button("Create Account")
        expect(page.current_path).to eq('/chitter')
        expect(page).to have_content("Welcome, username")
    end

    # unique username

end
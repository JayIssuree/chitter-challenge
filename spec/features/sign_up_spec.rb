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

    it "displays an error message when the password does not match the confirmation" do
        visit('/')
        click_button("Sign Up")
        fill_in("username", with: "username")
        fill_in("password", with: "password123")
        fill_in("password_confirmation", with: "not confirmed")
        click_button("Create Account")
        expect(page).to have_content('Username already taken or passwords do not match')
    end

    it "displays an error message when the username is already taken" do
        User.create(username: 'username123', password: 'password123')
        visit('/')
        click_button("Sign Up")
        fill_in("username", with: "username123")
        fill_in("password", with: "word of passing")
        fill_in("password_confirmation", with: "word of passing")
        click_button("Create Account")
        expect(page).to have_content('Username already taken or passwords do not match')
    end

end
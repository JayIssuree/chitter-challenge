describe "logging in", type: :feature do
    
    it "has a log in button" do
        visit('/')
        expect(page).to have_button('Log In')
    end

    it "has a log in form" do
        visit('/')
        click_button('Log In')
        expect(page.current_path).to eq('/session/new')
        expect(page).to have_field("username")
        expect(page).to have_field("password")
        expect(page).to have_button("Log In")
    end

    it "displays a welcome message on successful log in" do
        User.create(username: 'username123', password: 'password123')
        visit('/')
        click_button('Log In')
        fill_in("username", with: 'username123')
        fill_in("password", with: 'password123')
        click_button("Log In")
        expect(page.current_path).to eq('/chitter')
        expect(page).to have_content('Welcome, username123')
    end

    it "displays a flash notice on unsuccessful log in" do
        visit('/')
        click_button('Log In')
        fill_in("username", with: 'username123')
        fill_in("password", with: 'password123')
        click_button("Log In")
        expect(page).to have_content("Incorrect username or password")
    end
    
end
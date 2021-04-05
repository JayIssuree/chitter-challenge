describe "creating peeps", type: :feature do
    
    it "has a form to write a peep into" do
        visit('/')
        expect(page).to have_field("peep_text")
        expect(page).to have_button("Peep!")
    end

    it "submits a peep to be visible on the homepage" do
        visit('/')
        fill_in("peep_text", with: "this is an example peep")
        click_button("Peep!")
        expect(page).to have_content("this is an example peep")
    end

    it "displays peeps in reverse chronological order" do
        visit('/')
        fill_in("peep_text", with: "this peep should appear last")
        click_button("Peep!")
        fill_in("peep_text", with: "this peep should appear second")
        click_button("Peep!")
        fill_in("peep_text", with: "this peep should appear first")
        click_button("Peep!")
        expect(page).to have_selector("ul li:nth-child(1)", text: "this peep should appear first")
        expect(page).to have_selector("ul li:nth-child(2)", text: "this peep should appear second")
        expect(page).to have_selector("ul li:nth-child(3)", text: "this peep should appear last")
    end

    it "displays the time and date a peep was made" do
        visit('/')
        fill_in("peep_text", with: "time & date peep")
        time = Time.now
        click_button("Peep!")
        expect(page).to have_content(time.strftime("%A %d %B at %k:%M"))
    end

end
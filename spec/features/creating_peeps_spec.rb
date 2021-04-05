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

end
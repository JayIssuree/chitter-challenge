describe "posting a peep", type: :feature do
    
    it "has a form for posting a peep" do
        visit '/chitter'
        expect(page).to have_field("peep_text")
        expect(page).to have_button("Post Peep")
    end

    it "displays the peep on the page once submitted" do
        visit '/chitter'
        fill_in("peep_text", with: "this is an example peep")
        click_button("Post Peep")
        expect(page.current_path).to eq("/chitter")
        expect(page).to have_content("this is an example peep")
    end

end
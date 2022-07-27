require 'rails_helper'
RSpec.describe 'Bachelorette show page' do 
   it "displays that bachelorette's Name, Season num., Season description " do 
      bachelorette_1 = Bachelorette.create!(name: "JoJo", season_number: 13, description: "You ain't seen nothing yet!")
      bachelorette_2 = Bachelorette.create!(name: "Lisa", season_number: 14, description: "Heads will roll")
      bachelorette_3 = Bachelorette.create!(name: "Ray", season_number: 15, description: "The claws are out!")

      visit "/bachelorettes/#{bachelorette_1.id}"

      expect(page).to have_content("Name: JoJo")
      expect(page).to have_content("Season: 13")
      expect(page).to have_content("Description: You ain't seen nothing yet!")
      expect(page).to_not have_content("Name: Lisa")
   end

   it "has a link to see that bachelorette's contestants" do 
      bachelorette_1 = Bachelorette.create!(name: "JoJo", season_number: 13, description: "You ain't seen nothing yet!")
      bachelorette_2 = Bachelorette.create!(name: "Lisa", season_number: 14, description: "Heads will roll")
      bachelorette_3 = Bachelorette.create!(name: "Ray", season_number: 15, description: "The claws are out!")

      contestant_1 = Contestant.create!(name: "Stanton", age: 32, hometown: "South Plainfield", bachelorette_id: bachelorette_1.id)
      contestant_2 = Contestant.create!(name: "Laura", age: 30, hometown: "Cupertino", bachelorette_id: bachelorette_1.id)
      contestant_3 = Contestant.create!(name: "Sven", age: 28, hometown: "Austin", bachelorette_id: bachelorette_1.id)

      visit "/bachelorettes/#{bachelorette_1.id}"

      find_link('Contestants')

      expect(page).to have_link('Contestants')
   end

   it "redirects to that bachelorette's contestants index page where it displays her contestants" do 
      bachelorette_1 = Bachelorette.create!(name: "JoJo", season_number: 13, description: "You ain't seen nothing yet!")
      bachelorette_2 = Bachelorette.create!(name: "Lisa", season_number: 14, description: "Heads will roll")
      bachelorette_3 = Bachelorette.create!(name: "Ray", season_number: 15, description: "The claws are out!")

      contestant_1 = bachelorette_1.contestants.create!(name: "Stanton", age: 32, hometown: "South Plainfield", bachelorette_id: bachelorette_1.id)
      contestant_2 = Contestant.create!(name: "Laura", age: 30, hometown: "Cupertino", bachelorette_id: bachelorette_1.id)
      contestant_3 = Contestant.create!(name: "Sven", age: 28, hometown: "Austin", bachelorette_id: bachelorette_1.id)

      visit "/bachelorettes/#{bachelorette_1.id}"
      click_link('Contestants')

      expect(current_path).to eq("/bachelorettes/#{bachelorette_1.id}/contestants")
      expect(page).to have_content("Stanton")
   end

   it "shows the average age of that bacherlorette's contestants" do 
      bachelorette_1 = Bachelorette.create!(name: "JoJo", season_number: 13, description: "You ain't seen nothing yet!")
      bachelorette_2 = Bachelorette.create!(name: "Lisa", season_number: 14, description: "Heads will roll")
      bachelorette_3 = Bachelorette.create!(name: "Ray", season_number: 15, description: "The claws are out!")

      contestant_1 = Contestant.create!(name: "Stanton", age: 32, hometown: "South Plainfield", bachelorette_id: bachelorette_1.id)
      contestant_2 = Contestant.create!(name: "Laura", age: 30, hometown: "Cupertino", bachelorette_id: bachelorette_1.id)
      contestant_3 = Contestant.create!(name: "Sven", age: 28, hometown: "Austin", bachelorette_id: bachelorette_1.id)

      outting_1 = Outting.create!(location: "Helicopter Ride", theme: "Adventure")
      outting_2 = Outting.create!(location: "Picnic", theme: "Romantic")
      outting_3 = Outting.create!(location: "Basketball", theme: "Sport")

      con_out1 = ContestantOutting.create!(contestant_id: contestant_1.id, outting_id: outting_1.id)
      con_out2 = ContestantOutting.create!(contestant_id: contestant_1.id, outting_id: outting_2.id)
      con_out3 = ContestantOutting.create!(contestant_id: contestant_1.id, outting_id: outting_3.id)

      visit "/bachelorettes/#{bachelorette_1.id}"

      expect(page).to have_content("Average age: 30") 
   end
end


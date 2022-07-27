require 'rails_helper' 

RSpec.describe "Outtings show page" do 
   it "displays the outing location and theme" do #i changed this from the user story given to match my original migrations
      outting_1 = Outting.create!(location: "Helicopter Ride", theme: "Adventure")
      outting_2 = Outting.create!(location: "Picnic", theme: "Romantic")
      outting_3 = Outting.create!(location: "Basketball", theme: "Sport")
   
      visit "/outtings/#{outting_1.id}"

      expect(page).to have_content("Location: Helicopter Ride")
      expect(page).to have_content("Theme: Adventure")
      expect(page).to_not have_content("Location: Picnic")
   end

   it "shows a total count of contestants that were on this outting and their names" do 
      outting_1 = Outting.create!(location: "Helicopter Ride", theme: "Adventure")
      bachelorette_1 = Bachelorette.create!(name: "JoJo", season_number: 13, description: "You ain't seen nothing yet!")

      contestant_1 = Contestant.create!(name: "Stanton", age: 32, hometown: "South Plainfield", bachelorette_id: bachelorette_1.id)
      contestant_2 = Contestant.create!(name: "Laura", age: 30, hometown: "Cupertino", bachelorette_id: bachelorette_1.id)
      contestant_3 = Contestant.create!(name: "Sven", age: 28, hometown: "Austin", bachelorette_id: bachelorette_1.id)

      outting_1 = Outting.create!(location: "Helicopter Ride", theme: "Adventure")
      outting_2 = Outting.create!(location: "Picnic", theme: "Romantic")
      outting_3 = Outting.create!(location: "Basketball", theme: "Sport")
   
      con_out1 = ContestantOutting.create!(contestant_id: contestant_1.id, outting_id: outting_1.id)
      con_out2 = ContestantOutting.create!(contestant_id: contestant_2.id, outting_id: outting_1.id)
      con_out3 = ContestantOutting.create!(contestant_id: contestant_3.id, outting_id: outting_1.id)
      con_out4 = ContestantOutting.create!(contestant_id: contestant_1.id, outting_id: outting_2.id)

      visit "/outtings/#{outting_1.id}"

      expect(page).to have_content("Total contestants: 3")
      expect(page).to have_content("Stanton")
      expect(page).to have_content("Laura")
      expect(page).to have_content("Sven")
   end
end

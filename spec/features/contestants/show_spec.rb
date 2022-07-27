require 'rails_helper'

RSpec.describe "Contestant show page" do 
   it "displays the particular contestant's name, season number and season description this contestant was on, and a list of outing names" do 
      bachelorette_1 = Bachelorette.create!(name: "JoJo", season_number: 13, description: "You ain't seen nothing yet!")

      contestant_1 = Contestant.create!(name: "Stanton", age: 32, hometown: "South Plainfield", bachelorette_id: bachelorette_1.id)
      contestant_2 = Contestant.create!(name: "Laura", age: 30, hometown: "Cupertino", bachelorette_id: bachelorette_1.id)
      contestant_3 = Contestant.create!(name: "Sven", age: 28, hometown: "Austin", bachelorette_id: bachelorette_1.id)

      outting_1 = Outting.create!(location: "Helicopter Ride", theme: "Adventure")
      outting_2 = Outting.create!(location: "Picnic", theme: "Romantic")
      outting_3 = Outting.create!(location: "Basketball", theme: "Sport")

      con_out1 = ContestantOutting.create!(contestant_id: contestant_1.id, outting_id: outting_1.id)
      con_out2 = ContestantOutting.create!(contestant_id: contestant_1.id, outting_id: outting_2.id)
      con_out3 = ContestantOutting.create!(contestant_id: contestant_1.id, outting_id: outting_3.id)

      visit "/contestants/#{contestant_1.id}"

      expect(page).to have_content("Name: Stanton")
      expect(page).to have_content("Season: 13")
      expect(page).to have_content("Description: You ain't seen nothing yet!")

      expect(page).to have_content(outting_1.location)
      expect(page).to have_content(outting_2.location)
      expect(page).to have_content(outting_3.location)
   end

   it "displays the outting as a link" do 
      bachelorette_1 = Bachelorette.create!(name: "JoJo", season_number: 13, description: "You ain't seen nothing yet!")
      bachelorette_2 = Bachelorette.create!(name: "Lisa", season_number: 14, description: "Heads will roll")

      contestant_1 = Contestant.create!(name: "Stanton", age: 32, hometown: "South Plainfield", bachelorette_id: bachelorette_1.id)
      contestant_2 = Contestant.create!(name: "Laura", age: 30, hometown: "Cupertino", bachelorette_id: bachelorette_1.id)
      contestant_3 = Contestant.create!(name: "Sven", age: 28, hometown: "Austin", bachelorette_id: bachelorette_1.id)

      outting_1 = Outting.create!(location: "Helicopter Ride", theme: "Adventure")
      outting_2 = Outting.create!(location: "Picnic", theme: "Romantic")
      outting_3 = Outting.create!(location: "Basketball", theme: "Sport")

      con_out1 = ContestantOutting.create!(contestant_id: contestant_1.id, outting_id: outting_1.id)
      con_out2 = ContestantOutting.create!(contestant_id: contestant_1.id, outting_id: outting_2.id)
      con_out3 = ContestantOutting.create!(contestant_id: contestant_1.id, outting_id: outting_3.id)

      visit "/contestants/#{contestant_1.id}"

      expect(page).to have_link("Helicopter Ride")
   end
end
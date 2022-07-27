require 'rails_helper' 
RSpec.describe "Bachelorette's contestants index page" do 
   it "displays that bachelorette's contestants information" do 
      bachelorette_1 = Bachelorette.create!(name: "JoJo", season_number: 13, description: "You ain't seen nothing yet!")
      bachelorette_2 = Bachelorette.create!(name: "Lisa", season_number: 14, description: "Heads will roll")

      contestant_1 = Contestant.create!(name: "Stanton", age: 32, hometown: "South Plainfield", bachelorette_id: bachelorette_1.id)
      contestant_2 = Contestant.create!(name: "Laura", age: 30, hometown: "Cupertino", bachelorette_id: bachelorette_1.id)
      contestant_3 = Contestant.create!(name: "Sven", age: 28, hometown: "Austin", bachelorette_id: bachelorette_1.id)

      contestant_4 = Contestant.create!(name: "Sol", age: 24, hometown: "Lisbon", bachelorette_id: bachelorette_2.id)

      visit "/bachelorettes/#{bachelorette_1.id}/contestants"

      within "#contestants-#{contestant_1.id}" do 
         expect(page).to have_content("Name: Stanton")
         expect(page).to have_content("Age: 32")
         expect(page).to have_content("Hometown: South Plainfield")
      end

      within "#contestants-#{contestant_2.id}" do 
         expect(page).to have_content("Name: Laura")
         expect(page).to have_content("Age: 30")
         expect(page).to have_content("Hometown: Cupertino")
      end

      within "#contestants-#{contestant_3.id}" do 
         expect(page).to have_content("Name: Sven")
         expect(page).to have_content("Age: 28")
         expect(page).to have_content("Hometown: Austin")
      end
   end

   it "displays the contestant's name as a link" do 
      bachelorette_1 = Bachelorette.create!(name: "JoJo", season_number: 13, description: "You ain't seen nothing yet!")
      bachelorette_2 = Bachelorette.create!(name: "Lisa", season_number: 14, description: "Heads will roll")

      contestant_1 = Contestant.create!(name: "Stanton", age: 32, hometown: "South Plainfield", bachelorette_id: bachelorette_1.id)
      contestant_2 = Contestant.create!(name: "Laura", age: 30, hometown: "Cupertino", bachelorette_id: bachelorette_1.id)
      contestant_3 = Contestant.create!(name: "Sven", age: 28, hometown: "Austin", bachelorette_id: bachelorette_1.id)

      contestant_4 = Contestant.create!(name: "Sol", age: 24, hometown: "Lisbon", bachelorette_id: bachelorette_2.id)

      visit "/bachelorettes/#{bachelorette_1.id}/contestants"

      within "#contestants-#{contestant_1.id}" do 
         expect(page).to have_link("Stanton")
      end

      within "#contestants-#{contestant_2.id}" do 
         expect(page).to have_link("Laura")
      end

      within "#contestants-#{contestant_3.id}" do 
         expect(page).to have_link("Sven")
      end
   end

   it "redirects to that contestant's show page" do 
      bachelorette_1 = Bachelorette.create!(name: "JoJo", season_number: 13, description: "You ain't seen nothing yet!")
      bachelorette_2 = Bachelorette.create!(name: "Lisa", season_number: 14, description: "Heads will roll")

      contestant_1 = Contestant.create!(name: "Stanton", age: 32, hometown: "South Plainfield", bachelorette_id: bachelorette_1.id)
      contestant_2 = Contestant.create!(name: "Laura", age: 30, hometown: "Cupertino", bachelorette_id: bachelorette_1.id)
      contestant_3 = Contestant.create!(name: "Sven", age: 28, hometown: "Austin", bachelorette_id: bachelorette_1.id)

      contestant_4 = Contestant.create!(name: "Sol", age: 24, hometown: "Lisbon", bachelorette_id: bachelorette_2.id)

      visit "/bachelorettes/#{bachelorette_1.id}/contestants"

      within "#contestants-#{contestant_1.id}" do 
         click_link("Stanton")
         expect(current_path).to eq("/contestants/#{contestant_1.id}")
      end
   end

   it "lists a unique list of hometowns the contestants are from" do 
      bachelorette_1 = Bachelorette.create!(name: "JoJo", season_number: 13, description: "You ain't seen nothing yet!")
      bachelorette_2 = Bachelorette.create!(name: "Lisa", season_number: 14, description: "Heads will roll")

      contestant_1 = Contestant.create!(name: "Stanton", age: 32, hometown: "South Plainfield", bachelorette_id: bachelorette_1.id)
      contestant_2 = Contestant.create!(name: "Laura", age: 30, hometown: "South Plainfield", bachelorette_id: bachelorette_1.id)
      contestant_3 = Contestant.create!(name: "Sven", age: 28, hometown: "Austin", bachelorette_id: bachelorette_1.id)
      contestant_4 = Contestant.create!(name: "Sol", age: 24, hometown: "Lisbon", bachelorette_id: bachelorette_1.id)

      visit "/bachelorettes/#{bachelorette_1.id}/contestants"
      
      expect(page).to have_content("Austin")
      expect(page).to have_content("Lisbon")
   end
end


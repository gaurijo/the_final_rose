require 'rails_helper' 

RSpec.describe Outting, type: :model do 
   describe 'relationships' do 
      it {should have_many :contestant_outtings }
      it {should have_many(:contestants).through(:contestant_outtings) }
   end

   describe 'model methods' do 
      it 'has a total count of contestants for that outting' do 
         outting_1 = Outting.create!(location: "Helicopter Ride", theme: "Adventure")

         bachelorette_1 = Bachelorette.create!(name: "JoJo", season_number: 13, description: "You ain't seen nothing yet!")

         contestant_1 = Contestant.create!(name: "Stanton", age: 32, hometown: "South Plainfield", bachelorette_id: bachelorette_1.id)
         contestant_2 = Contestant.create!(name: "Laura", age: 30, hometown: "Cupertino", bachelorette_id: bachelorette_1.id)
         contestant_3 = Contestant.create!(name: "Sven", age: 28, hometown: "Austin", bachelorette_id: bachelorette_1.id)

         outting_1 = Outting.create!(location: "Helicopter Ride", theme: "Adventure")
         outting_2 = Outting.create!(location: "Picnic", theme: "Romantic")
         outting_3 = Outting.create!(location: "Basketball", theme: "Sport")

         con_out1 = ContestantOutting.create!(contestant_id: contestant_1.id, outting_id: outting_1.id)
         con_out2 = ContestantOutting.create!(contestant_id: contestant_1.id, outting_id: outting_1.id)
         con_out3 = ContestantOutting.create!(contestant_id: contestant_1.id, outting_id: outting_1.id)

         expect(outting_1.total_contestants).to eq(3)
      end
   end
end
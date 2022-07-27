require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
  end

  describe 'model methods' do 
    it "average_age" do 
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

      expect(bachelorette_1.average_age).to eq(30)
    end
  end

  it "unique_hometowns" do 
      bachelorette_1 = Bachelorette.create!(name: "JoJo", season_number: 13, description: "You ain't seen nothing yet!")

      contestant_1 = Contestant.create!(name: "Stanton", age: 32, hometown: "South Plainfield", bachelorette_id: bachelorette_1.id)
      contestant_2 = Contestant.create!(name: "Laura", age: 30, hometown: "South Plainfield", bachelorette_id: bachelorette_1.id)
      contestant_3 = Contestant.create!(name: "Sven", age: 28, hometown: "Austin", bachelorette_id: bachelorette_1.id)
      contestant_4 = Contestant.create!(name: "Sol", age: 24, hometown: "Lisbon", bachelorette_id: bachelorette_1.id)

      expect(bachelorette_1.unique_hometowns).to eq(["South Plainfield", "Austin", "Lisbon"])
  end
end

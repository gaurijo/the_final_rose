class Outting < ApplicationRecord 
   has_many :contestant_outtings
   has_many :contestants, through: :contestant_outtings 

   def total_contestants
      contestants.count
   end
end
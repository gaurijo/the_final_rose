class Contestant <ApplicationRecord
  belongs_to :bachelorette
  has_many :contestant_outtings
  has_many :outtings, through: :contestant_outtings 
end

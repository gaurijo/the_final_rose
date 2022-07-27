class CreateContestantOuttings < ActiveRecord::Migration[5.2]
  def change
    create_table :contestant_outtings do |t|
      t.references :contestant, foreign_key: true
      t.references :outting, foreign_key: true
    end
  end
end

class CreateOuttings < ActiveRecord::Migration[5.2]
  def change
    create_table :outtings do |t|
      t.string :location
      t.string :theme

      t.timestamps
    end
  end
end

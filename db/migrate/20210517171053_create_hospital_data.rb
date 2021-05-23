class CreateHospitalData < ActiveRecord::Migration[5.2]
  def change
    create_table :hospital_data do |t|
      t.string :name
      t.integer :oxygen_can
      t.integer :bed

      t.timestamps
    end
  end
end

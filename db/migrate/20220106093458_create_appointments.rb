class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :physician, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.integer :appointment_date

      t.timestamps
    end
  end
end
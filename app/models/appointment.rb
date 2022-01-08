class Appointment < ApplicationRecord
  belongs_to :physician
  belongs_to :patient
  scope :recent,->{order(appointments.updated_at DESC)}
end

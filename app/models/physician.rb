class Physician < ApplicationRecord
    has_many :appointments
    has_many :patients, through: :appointments
    has_many :images, as: :imageable
end

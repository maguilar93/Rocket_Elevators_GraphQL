class Customer < ApplicationRecord
    belongs_to :address
    has_many :buildings
end

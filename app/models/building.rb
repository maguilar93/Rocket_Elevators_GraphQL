class Building < ApplicationRecord
    has_many :batteries
    has_many :building_detail
    belongs_to :address
end

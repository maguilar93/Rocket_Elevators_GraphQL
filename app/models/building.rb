class Building < ApplicationRecord
    has_many :batteries
    has_one :building_detail
    belongs_to :address
end

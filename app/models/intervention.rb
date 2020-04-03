class Intervention < ApplicationRecord
    belongs_to :Customer
    belongs_to :Building
    belongs_to :Battery
    belongs_to :Column, optional: true
    belongs_to :Elevator, optional: true
    belongs_to :Employee, optional: true
end

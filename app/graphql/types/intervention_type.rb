module Types
  class InterventionType < Types::BaseObject
    field :id, ID, null: true
    field :employeeId, Int, null: true, method: :employee_id
    field :buildingId, Int, null: true, method: :building_id
    field :batteryId, Int, null: true, method: :battery_id
    field :columnId, Int, null: true, method: :column_id
    field :elevatorId, Int, null: true, method: :elevator_id
    # field :building, BuildingType, null: true
    field :dateStartIntervention, String, null: true, method: :date_start_intervention
    field :dateEndIntervention, String, null: true, method: :date_end_intervention
    field :building, BuildingType, null: true
    field :getcustomers, CustomerType, null: true
    
  end
end

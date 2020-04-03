module Types
  class InterventionType < Types::BaseObject
    field :id, ID, null: false
    field :employeeId, Int, null: false, method: :employee_id
    field :buildingId, Int, null: false, method: :building_id
    field :building, BuildingType, null: false
    field :dateStartIntervention, String, null: false, method: :date_start_intervention
    field :dateEndIntervention, String, null: false, method: :date_end_intervention
  end
end

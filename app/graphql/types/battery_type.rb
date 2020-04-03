module Types
    class BatteryType < Types::BaseObject
      field :id, Integer, null: false
      field :batteryType, String, null: false, method: :battery_type
      field :status, String, null: false
    #   field :buildingId, BuildingType, null: false, method: :building_id
    #   field :employeeId, integer, null: false, method: :employee_id
    end
  end
module Types
    class BatteryType < Types::BaseObject
      field :id, Integer, null: true
      field :batteryType, String, null: true, method: :battery_type
      field :status, String, null: true
    #   field :buildingId, BuildingType, null: true, method: :building_id
    #   field :employeeId, integer, null: true, method: :employee_id
    end
  end
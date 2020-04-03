module Types
  class ColumnType < Types::BaseObject
    field :id, Integer, null: false
    field :columnType, String, null: false, method: :column_type
    field :numberFloors, Integer, null: false, method: :number_floors
    field :status, String, null: false
  end
end

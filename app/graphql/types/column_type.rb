module Types
  class ColumnType < Types::BaseObject
    field :id, Integer, null: true
    field :columnType, String, null: true, method: :column_type
    field :numberFloors, Integer, null: true, method: :number_floors
    field :status, String, null: true
  end
end

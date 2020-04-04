module Types
  class BuildingdetailsType < Types::BaseObject
    field :id, ID, null: true
    field :infoKey, String, null: true, method: :info_key
    field :value, String, null: true
  end
end

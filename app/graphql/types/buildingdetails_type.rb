module Types
  class BuildingdetailsType < Types::BaseObject
    field :id, ID, null: false
    field :infoKey, String, null: false, method: :info_key
    field :value, String, null: false
  end
end

module Types
  class BuildingType < Types::BaseObject

      field :id, ID, null: false
      field :adminFullName, String, null: false, method: :admin_full_name 
      field :adminEmail, String, null: false, method: :admin_email
      field :adminPhone, String, null: false, method: :admin_phone
      field :techFullName, String, null: false, method: :tech_full_name
      field :techEmail, String, null: false, method: :tech_email
      field :techPhone, String, null: false, method: :tech_phone
      field :customerId, Integer, null: false, method: :customer_id
      field :addressId, Integer, null: false, method: :address_id
      field :address, AddressType, null: false
      # field :buildingDetails, BuildingdetailType, null: false, method: :building_details
      # field :customer, CustomerType, null: false


  end
end

module Types
    class GetcusomersType < Types::BaseObject
  
        field :id, ID, null: true
        field :adminFullName, String, null: true, method: :admin_full_name 
        field :adminEmail, String, null: true, method: :admin_email
        field :adminPhone, String, null: true, method: :admin_phone
        field :techFullName, String, null: true, method: :tech_full_name
        field :techEmail, String, null: true, method: :tech_email
        field :techPhone, String, null: true, method: :tech_phone
        field :customerId, Integer, null: true, method: :customer_id
        field :addressId, Integer, null: true, method: :address_id
        field :address, AddressType, null: true
        field :intervention, InterventionType, null: true
        field :customer, CustomerType, null: true
        
  
        # field :buildingDetails, BuildingdetailType, null: true, method: :building_details
        # field :customer, CustomerType, null: true
  
  
  
    end
  end
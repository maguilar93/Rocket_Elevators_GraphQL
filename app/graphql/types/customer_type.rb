module Types
  class CustomerType < Types::BaseObject
    field :id, ID, null: true
    field :fullNameSTA, String, null: true, method: :full_name_STA
    # field :addressId, AddressType, null: true, method: :address_id
    field :phone, String, null: true
    field :companyName, String, null: true, method: :company_name
    field :email, String, null: true, method: :contact_email
    field :building, BuildingType, null: true
    field :intervention, InterventionType, null: true

  end
end

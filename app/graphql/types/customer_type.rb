module Types
  class CustomerType < Types::BaseObject
    field :id, ID, null: false
    field :fullNameSTA, String, null: true, method: :full_name_STA
    # field :addressId, AddressType, null: false, method: :address_id
    field :phone, Integer, null: false
    field :companyName, String, null: false, method: :company_name
    field :email, String, null: false, method: :contact_email
    # field :building, BuildingType, null: true
  end
end
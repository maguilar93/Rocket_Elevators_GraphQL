module Types
  class AddressType < Types::BaseObject
      field :id, Int, null: false
      field :numberNStreet, String, null: false, method: :number_n_street
      field :status, String, null: false
      field :city, String, null: false
      field :country, String, null: false
      field :postalCode, String, null: false, method: :postal_code
  end
end

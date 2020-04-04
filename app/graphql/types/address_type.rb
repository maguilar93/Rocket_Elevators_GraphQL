module Types
  class AddressType < Types::BaseObject
      field :id, Int, null: true
      field :numberNStreet, String, null: true, method: :number_n_street
      field :status, String, null: true
      field :city, String, null: true
      field :country, String, null: true
      field :postalCode, String, null: true, method: :postal_code
  end
end

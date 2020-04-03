module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me

    field :fact, [FactType], null: false

    field :author, FactType, null: false do
      description 'Find a author by ID'
      argument :id, ID, required: true
    end

    def fact
      Lead.all
    end

    def author(id:)
      Lead.find(id)
    end
    
  end
end

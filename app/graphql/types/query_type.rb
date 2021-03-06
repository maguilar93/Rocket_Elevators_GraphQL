module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    $conn = PG.connect(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", port: "5432", dbname:"mariaaguilar", user: "codeboxx", password: "Codeboxx1!")

    field :intervention, InterventionType, null: false do
      argument :id, ID, required: false
    end
    def intervention(id:)
      res = $conn.exec("SELECT * FROM fact_intervention where id = #{id}")
      intervention = res[0]
      building = Building.find(intervention["building_id"])
      intervention[:building] = building
      return intervention
    end

    field :get_employee_interventions, InterventionType, null: false do
      argument :id, ID, required: false
    end
    def get_employee_interventions(id:)
      res = $conn.exec("SELECT * FROM fact_intervention where employee_id = #{id}")
      intervention = res[0]
      building = Building.find(intervention["building_id"])
      intervention[:building] = buildingdetails
      
    end

    
    #Building Query
    field :buildings, [Types::BuildingType], null: false
    def buildings
      Building.all
    end
    field :building, Types::BuildingType, null: false do
      argument :id, ID, required: true
    end
    def building(id:)
      Building.find(id)
    end

    #Address Query
    field :addresses, [Types::AddressType], null: false
    def addresses
      Address.all
    end
    # field :address, Types::AddressType, null: false do
    #   argument :id, ID, required: true
    # end
    # def address(id:)
    #   Address.find(id)
    # end

    #Building Details Query
    field :buildingsdetails, [Types::BuildingdetailsType], null: false
    def buildingsdetails
      BuildingDetail.all
    end
    field :buildingdetails, Types::BuildingdetailsType, null: false do
      argument :id, ID, required: true
    end
    def buildingdetails(id:)
      BuildingDetail.find(id)
    end

    # #Battery Query
    field :battery, BatteryType, null: false do
      argument :id, ID, required: true
    end
    def battery(id:) 
      Battery.find(id)
    end
    field :batteries, [BatteryType], null: false
    def batteries
      Battery.all
    end

    # #Column Query
    field :column, ColumnType, null: false do
      argument :id, ID, required: true
    end
    def column(id:)
      Column.find(id)
    end
    field :columns, [ColumnType], null: false
    def columns
      Column.all
    end

    # Customer Query
    field :customer, CustomerType, null: false do
      argument :id, ID, required: true
      argument :building_id, ID, required: false
    end
    def customer(id:) 
      Customer.find(id)
    end
    field :customers, [CustomerType], null: false
    def customers
      Customer.all
    end
    


    def elevators
      Elevator.all
    end

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
  end
end

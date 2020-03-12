# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Employee.create!(first_name: 'admin', last_name: 'istrator', title: 'A', email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Employee.create!(first_name: 'jackie', last_name: 'lai', title: 'B', email: 'jack@q', password: 'testing', password_confirmation: 'testing') if Rails.env.development?
Employee.create!(first_name: '123', last_name: '321', title: '0', email: '123@123', password: '123123', password_confirmation: '123123') if Rails.env.development?


require 'faker'
require 'date'

i = 0

300.times do |n|
    Email = Faker::Internet.email
    Title = Faker::Lorem.word #problem
    First = Faker::Name.first_name
    Last = Faker::Name.last_name
    batteryId =  i += 1
    AddressA = Faker::Address.street_address
    Name = Faker::Name.name
    City = Faker::Address.city
    Secondary_Address = Faker::Address.secondary_address
    Street = Faker::Address.street_name
    Business = Faker::Company.name
    Email = Faker::Internet.email
    Phone = Faker::PhoneNumber.phone_number
    Years = 1976+rand(42)
    Year = 2020+rand(3)
    Month = 1+rand(11)
    Day = 1+rand(28)
    d = Date.new(Years, Month, Day)
    c = Date.new(Year, Month, Day)
    d.strftime("%F")
    c.strftime("%F")
    Type = Faker::Lorem.word
    Floors = 0+rand(50)
    Status = Faker::Lorem.word
    Information = Faker::Lorem.sentence
    Notes = Faker::Lorem.sentence
    Test = rand(4)
    if (Test != 1) then
        Information = ""
    end

    Lead.create(
        full_name: Name,
        company_name: Business,
        email: Email,
        phone: Phone,
        project_name: Type,
        :Description => Information,
        department: Status,
        message: Information,
        date_of_contact: c
    )

    1.times do |n|
    
        addressB = Address.create!(
            type_of_address: AddressA,
            status: Status,
            entity: Status,
            number_n_street: Street,
            suite_or_apt: Secondary_Address,
            city: City,
            postal_code: Status,
            country: Status,
            notes: Notes
        )

        customers = Customers.create!(
            # user_id:  ,
            customer_create_date: d,
            company_name: Business,
            company_hq_addr_ID: addressB.id,
            name_company_contact: Name,
            company_phone: Phone,
            contact_email: Email,
            company_desc: Notes,
            full_name_STA: Name,
            tech_authority_phone: Phone,
            tech_manager_email: Email,
        )

        building  = Building.create!(
            customer_ID:  customer.id,
            address_ID: addressB.id,
            full_name_building_admin: Name,
            admin_email: Email,
            admin_phone: Phone,
            full_name_tech_contact: Name,
            tech_email: Email,
            tech_phone: Phone,
            # created_at: c
        )
        Building_Detail.create!(
            building_id:  building.id,
            Information_Key: Type,
            Value: Type
        )

        1.times do |n|
            battery = Battery.create!(
                building_ID: building.id,
                battery_type: Type,
                status: Status,
                employee_ID: employee.id,
                date_commision: Type,
                date_last_inspect: Years,
                certificate_operations: Notes,
                info: Notes,
                notes: Notes,
                # created_at: c
            )

            rand(1..8).times do |n|
                column = Column.create!(
                    battery_id: battery.id,
                    column_type: Type,
                    number_floors: Floors,
                    status: Status,
                    info: Notes,
                    notes: Notes
                )

                rand(1..10).times do |n|
                    Elevator.create!(
                        column_ID:  column.id,
                        serial_number: Type,
                        model: Type,
                        elevator_type: Type,
                        status: Status,
                        date_commision: c,
                        date_last_inspect: c,
                        certificate_inspect: Type,
                        info: Notes,
                        notes: Notes,
                        # created_at: c
                    )
                end
            end
        end
    end
end
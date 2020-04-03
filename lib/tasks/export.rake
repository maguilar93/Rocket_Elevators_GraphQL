require 'pg'
require 'faker'

namespace :transfer do
    desc "export to postgresql"
    task data: :environment do
        connected = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", port: "5432", dbname:"mariaaguilar", user: "codeboxx", password: "Codeboxx1!")

        # prepares all the queries
        connected.prepare('to_fact_contacts', "INSERT INTO \"fact_contacts\" (date_created, company_name, email, project_name) VALUES ($1,$2,$3,$4)")
        connected.prepare('to_fact_quotes', "INSERT INTO \"fact_quotes\" (date_created, company_name, email, nbelevs) VALUES ($1,$2,$3,$4)")
        connected.prepare('to_fact_elevators', "INSERT INTO \"fact_elevators\" (serial_number, commissioning_date, building_id, customer_id, city) VALUES ($1,$2,$3,$4,$5)")
        connected.prepare('to_dim_customers', "INSERT INTO \"dim_customers\" (date_created, company_name, contact_name, contact_email, nbelevs, customer_city) VALUES ($1,$2,$3,$4,$5,$6)")

        # resets fact_contacts table and re-import values
        connected.exec ("TRUNCATE fact_contacts RESTART IDENTITY")
        Lead.all.each do |lead|
            connected.exec_prepared('to_fact_contacts',[lead.created_at, lead.company_name, lead.email, lead.project_name])
        end
    
        # resets fact_contacts table and re-import values
        connected.exec ("TRUNCATE fact_quotes RESTART IDENTITY")
        Quote.all.each do |quote|
            connected.exec_prepared('to_fact_quotes', [quote.created_at, quote.Company_Name, quote.Email, quote.Nb_Cage])
        end

        # resets fact_contacts table and re-import values
        connected.exec ("TRUNCATE fact_elevators RESTART IDENTITY")
        Elevator.all.each do |elevator|
            connected.exec_prepared('to_fact_elevators', [elevator.serial_number, elevator.date_commision, elevator.column.battery.building_id, elevator.column.battery.building.customer_id, elevator.column.battery.building.address.city])
        end

        # resets fact_contacts table and re-import values
        connected.exec("TRUNCATE dim_customers RESTART IDENTITY")
        Customer.all.each do |customer|
            nb_elevators = 0
            customer.buildings.all.each do |building|
                building.batteries.all.each do |battery|
                    battery.columns.all.each do |column|
                        nb_elevators += column.elevators.count
                    end
                end
            end
            connected.exec_prepared('to_dim_customers', [customer.created_at, customer.company_name, customer.name_company_contact, customer.contact_email, nb_elevators, customer.address.city])
        end
    end

    desc "create my database"
    task init: :environment do
        puts "hi"
        connected = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", port: "5432", dbname: 'postgres', user: "codeboxx", password: "Codeboxx1!")
        puts connected
        connected.exec("CREATE DATABASE MariaAguilar")
    end

    # import data for table fact intervention on postgres
    desc "fact intervention"
    task fact_intervention: :environment do
        connected = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", port: "5432", dbname:"mariaaguilar", user: "codeboxx", password: "Codeboxx1!")

        # prepares all the queries
        connected.prepare('to_fact_intervention', "INSERT INTO \"fact_intervention\" (employee_id, building_id,elevator_id, battery_id, column_id, date_start_intervention, date_end_intervention, result, report, status) VALUES ($1,$2,$3,$4,$5,$6,$7,$8, $9, $10)")

        # resets fact_contacts table and re-import values
        connected.exec ("TRUNCATE fact_intervention RESTART IDENTITY")
        Elevator.all.each do |elevator|
            date_start = Faker::Time.between(from: DateTime.now - 1400, to: DateTime.now, format: :default)
            date_end = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default)
            result = ["Success","Failure","Incomplete"].sample
            status = ["Pending", "InProgress", "Interrupted", "Resumed", "Complete"].sample
            report = Faker::Lorem.sentence(word_count: 4, supplemental: true, random_words_to_add: 3)
            connected.exec_prepared('to_fact_intervention',[elevator.column.battery.employee_id, elevator.column.battery.building_id, elevator.id, elevator.column.battery_id, elevator.column_id, date_start, date_end, result, report, status])
        end
    end
end









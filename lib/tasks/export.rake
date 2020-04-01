require 'pg'
namespace :transfer do
    desc "export to postgresql"
    task data: :environment do
        connected = PG::Connection.open(host: "localhost", port: "5432", dbname:"warehouse", user: "postgres", password: "1e1jjffwjf9")
        
        # prepares all the queries
        connected.prepare('to_fact_contacts', "INSERT INTO \"fact_contacts\" (date_created, company_name, email, project_name) VALUES ($1,$2,$3,$4)")
        connected.prepare('to_fact_quotes', "INSERT INTO \"fact_quotes\" (quote_id, date_created, company_name, email, nb_elevators) VALUES ($1,$2,$3,$4,$5)")
        connected.prepare('to_fact_elevators', "INSERT INTO \"fact_elevators\" (serial_number, commissioning_date, building_id, customer_id, city) VALUES ($1,$2,$3,$4,$5)")
        connected.prepare('to_dim_customers', "INSERT INTO \"dim_customers\" (date_created, company_name, contact_name, contact_email, nb_elevators, customer_city) VALUES ($1,$2,$3,$4,$5,$6)")
        connected.prepare('to_fact_intervention', "INSERT INTO \"fact_intervention\" (column_id, elevator_id, employee_id, building_id, battery_id, intervention_start_date, intervention_end_date, result, report, status) VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10)")

        # resets fact_contacts table and re-import values
        connected.exec ("TRUNCATE fact_contacts RESTART IDENTITY")
        Lead.all.each do |lead|
            connected.exec_prepared('to_fact_contacts',[lead.created_at, lead.company_name, lead.email, lead.project_name])
        end
    
        # resets fact_contacts table and re-import values
        connected.exec ("TRUNCATE fact_quotes RESTART IDENTITY")
        Quote.all.each do |quote|
            connected.exec_prepared('to_fact_quotes', [quote.id, quote.created_at, quote.Company_Name, quote.Email, quote.Nb_Cage])
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

        # resets fact_intervention table and re-imports values
        connected.exec("TRUNCATE fact_intervention RESTART IDENTITY")
        Elevator.all.each do |elevator|
            connected.exec_prepared('to_fact_intervention', [Elevator.columns.id, Elevator.id ])
        end
    end

    desc "create my database"
    task init: :environment do
        puts "hi"
        connected = PG::Connection.open(host: "localhost", port: "5432", dbname:"postgres", user: "postgres", password: "1e1jjffwjf9")
        puts connected
        connected.exec("CREATE DATABASE JackieLai")
    end

    desc "test"
    task data: :environment do
        #ici maria :)
    end
end









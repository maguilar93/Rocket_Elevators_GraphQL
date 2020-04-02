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
        connected.prepare('to_fact_intervention', "INSERT INTO \"fact_intervention\" (employee_id, building_id, battery_id, column_id, elevator_id, date_start_intervention, hour_start_intervention, date_end_intervention, hour_end_intervention, result, report, status) VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12)")


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

        
        # resets fact_intervention table and re-import values
        connected.exec ("TRUNCATE fact_intervention RESTART IDENTITY")
        Elevator.all.each do |elevator|

            50.times do |n|
                reportF = Faker::Lorem.sentence(word_count: 4, supplemental: true, random_words_to_add: 3)
                resultF = ["Success", "Failure", "Incomplete"].sample
                statusF = ["Pending", "InProgress", "Interrupted", "Resumed", "Complete"].sample
                yearF = rand(2017..2019)
                monthF = rand(1..12)
                if monthF == 2
                    dayF = rand(1..28)
                else
                    dayF = rand(1..30)
                end
                c = Date.new(yearF, monthF, dayF)
                c.strftime("%F")

                interventionF = Faker::Time.backward(days: 300, format: :default) #=> "2014-09-17 19:56:33 -0700"

                connected.exec_prepared('to_fact_intervention', [elevator.column.battery.employee_id, elevator.column.battery.building_id, elevator.column.battery_id, elevator.column_id, elevator.id, date_start_intervention:c, hour_start_intervention: interventionF, date_end_intervention:c, hour_end_intervention: interventionF, result: resultF, report: reportF, status: statusF ])
            end
        end
    end

    desc "create my database"
    task init: :environment do
        puts "hi"
        connected = PG::Connection.open(host: "codeboxx-postgresql.cq6zrczewpu2.us-east-1.rds.amazonaws.com", port: "5432", dbname: 'postgres', user: "codeboxx", password: "Codeboxx1!")
        puts connected
        connected.exec("CREATE DATABASE MariaAguilar")
    end

    desc "test"
    task data: :environment do
        #ici maria :)
    end
end









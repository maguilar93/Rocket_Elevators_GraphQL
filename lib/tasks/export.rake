require 'pg'
namespace :rocket do

   desc "export to postgresql"
   task dwh: :environment do

       conn = PG::Connection.open(dbname: "rocket_test")

       conn.exec ("TRUNCATE fact_quotes RESTART IDENTITY")
       quote.all.each do |quote|
           conn.exec("INSERT INTO \"fact_quotes\" (quote_id, creation_date_company, name, email, nb_elevators)
           VALUES (#{quote.id}, '#{quote.created_at}', '#{quote.Company_Name}', '#{quote.Email}', '#{quote.Nb_Cage}')")
       end

        conn.exec ("TRUNCATE fact_contacts RESTART IDENTITY")
        lead.all.each do |lead|
            conn.exec("INSERT INTO \"fact_contacts\" (contact_id, creation_date, company_name, email, project_name)
            VALUES (#{lead.id}, '#{lead.created_at}', '#{lead.company_name}', '#{lead.email}', '#{lead.project_name}')")
       end

        conn.exec ("TRUNCATE fact_elevators RESTART IDENTITY")
        elevator.all.each do |elevator|
           conn.exec("INSERT INTO \"fact_elevators\" (elevator_id, serial_number, commissioning_date, building_id, customer_id, city_of_building)
           VALUES (#{elevator.id}, '#{elevator.serial_number}', '#{elevator.commissioning_date}', '#{elevator.column.battery.building_id}', '#{elevator.column.battery.building.customer_id}', '#{elevator.column.battery.building.address.city}')")
       end

        conn.exec("TRUNCATE dim_customers RESTART IDENTITY")
        customer.all.each do |customer|
            nb_elevators = 0
            customer.buildings.all.each do |building|
               
                building.batteries.all.each do |battery|
                    
                    battery.columns.all.each do |column|
                      
                      nb_elevators += column.elevators.count
                           
                    end
                end
            end

            conn.exec ("INSERT INTO \"dim_customers\" (creation_date, company_name, name_of_company_contact, email_company, nb_elevators, customer_city)
            VALUES ('#{customer.created_at}', '#{customer.company_name}', '#{customer.full_name}', '#{customer.email}', #{nb_elevators}, '#{customer.address.city}')")
            
        end


   end
end









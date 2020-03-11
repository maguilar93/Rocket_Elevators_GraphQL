ActiveAdmin.register Building do
    belongs_to :Address
    permit_params :address_ID, :customer_ID, :full_name_building_admin, :admin_email, :admin_phone, :full_name_tech_contact, :tech_email, :tech_phone

    index do
        selectable_column
        id_column
        # column :customer_create_date
        column :address_ID
        column :customer_ID
        column :full_name_building_admin
        column :admin_email
        column :admin_phone
        column :full_name_tech_contact
        column :tech_email
        column :tech_phone
        actions
    end
  
    filter :full_name_building_admin
    filter :full_name_tech_contact

    form do |f|
        f.inputs do
            # f.input :customer_create_date
            f.input :address_ID
            f.input :customer_ID
            f.input :full_name_building_admin
            f.input :admin_email
            f.input :admin_phone
            f.input :full_name_tech_contact
            f.input :tech_email
            f.input :tech_phone
        end
        f.actions
    end
end
ActiveAdmin.register Customer do
    belongs_to :Address
    permit_params :customer_create_date, :company_name, :company_hq_addr_ID, :name_company_contact, :company_phone, :contact_email, :company_desc, :full_name_STA, :tech_authority_phone, :tech_manager_email
  
    index do
        selectable_column
        id_column
        column :customer_create_date
        column :company_name
        column :company_hq_addr_ID
        column :name_company_contact
        column :company_phone
        column :contact_email
        column :company_desc
        column :full_name_STA
        column :tech_authority_phone
        column :tech_manager_email
        actions
    end
  
    filter :company_name
    filter :company_desc
    filter :company_hq_addr_ID

    form do |f|
        f.inputs do
            f.input :customer_create_date
            f.input :company_name
            f.input :company_hq_addr_ID
            f.input :name_company_contact
            f.input :company_phone
            f.input :contact_email
            f.input :company_desc
            f.input :full_name_STA
            f.input :tech_authority_phone
            f.input :tech_manager_email
        end
        f.actions
    end
end
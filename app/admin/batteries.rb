ActiveAdmin.register Battery do
    belongs_to :building
    permit_params 

    index do
        selectable_column
        id_column
        # column :customer_create_date
        actions
    end
  
    # filter :company_name

    form do |f|
        f.inputs do
            # f.input :customer_create_date
        end
        f.actions
    end
end
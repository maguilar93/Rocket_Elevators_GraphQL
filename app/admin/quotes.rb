ActiveAdmin.register Quote do
  
    index do
      selectable_column
      id_column
      column :Full_Name
      column :Building_Type
      column :Product_Grade
      column :Nb_Appartement
      column :Nb_Business
      column :Nb_Floor
      column :Nb_Basement
      column :Nb_Cage
      column :Nb_Parking
      column :Nb_OccupantPerFloor
      column :Nb_OpperatingHour
      column :Final_Price
      actions
    end
  
    filter :Full_Name
    filter :Building_Type
    filter :Product_Grade
    filter :Final_Price
  end
  
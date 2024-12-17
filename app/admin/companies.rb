ActiveAdmin.register Company do
  permit_params :name, :logo, :address, :contact_number, :website

  filter :name
  filter :address

  index do
    selectable_column
    id_column
    column :name
    column :address
    column :contact_number
    column :website
    actions
  end

  form do |f|
    f.inputs "Company Details" do
      f.input :name
      f.input :logo
      f.input :address
      f.input :contact_number
      f.input :website
    end
    f.actions
  end
end
ActiveAdmin.register Message do
  permit_params :name, :email, :phone_number, :content

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :phone_number
    column :content
    actions
  end

  filter :name
  filter :email
  filter :phone_number
  filter :created_at
  filter :updated_at

  form  do |f|
    f.inputs "Message" do
      f.input :name
      f.input :email
      f.input :phone_number
      f.input :content
    end
    f.actions
  end
end

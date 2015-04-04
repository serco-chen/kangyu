ActiveAdmin.register Blog do
  permit_params :title, :body

  index do
    selectable_column
    id_column
    column :title
    column :body
    actions
  end

  filter :title
  filter :body
  filter :created_at
  filter :updated_at

  form  do |f|
    f.inputs "Product" do
      f.input :title
      f.input :body
    end
    f.actions
  end


  show do |product|
    attributes_table do
      row :title
      row :body
    end
  end
end

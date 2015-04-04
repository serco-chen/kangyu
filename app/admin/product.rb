ActiveAdmin.register Product do
  permit_params :title, :description, :product_type, images_attributes: [:id, :file, :file_file_name, :_destroy]

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :product_type
    column "Image Count" do |product|
      product.images.size
    end
    actions
  end

  filter :title
  filter :description
  filter :created_at
  filter :updated_at

  form :html => {:multipart => true} do |f|
    f.inputs "Product" do
      f.input :title
      f.input :description
      f.input :product_type, as: :select, collection: Product.product_types.keys
      f.inputs do
        f.has_many :images, allow_destroy: true, new_record: '上传文件' do |t|
          t.input :file, as: :file
        end
      end
    end
    f.actions
  end


  show do |product|
    attributes_table do
      row :title
      row :description

      row "Images" do
        ul do
          product.images.each do |img|
            li do
              image_tag(img.file.url)
            end
          end
        end
      end
    end
  end
end

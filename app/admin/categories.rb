ActiveAdmin.register Category do
  config.sort_order = 'name_asc'

  permit_params :name

  filter :name
  filter :created_at
  filter :updated_at

  show do
    attributes_table do
      row :name
      row :created_at
      row :updated_at
    end
  end
end

ActiveAdmin.register Doctor do
  config.sort_order = 'name_asc'
  config.per_page = 15

  permit_params :categories

  filter :categories

  index do
    selectable_column
    id_column
    column :first_name do |doctor|
      doctor.user.first_name
    end
    column :last_name do |doctor|
      doctor.user.last_name
    end
    column :category do |doctor|
      doctor.categories.map(&:name)
    end
    column :phone_number do |doctor|
      doctor.user.phone_number
    end
    column :email do |doctor|
      doctor.user.email
    end
    column :created_at do |doctor|
      doctor.created_at
    end
    column :updated_at do |doctor|
      doctor.updated_at
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :categories, as: :check_boxes
    end

    f.actions
  end

  controller do
    def update
      categories = params[:doctor][:category_ids].map { |id| Category.find_by_id(id) }.compact
      resource.update(categories: categories)
    end
  end
end

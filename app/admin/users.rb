ActiveAdmin.register User do
  config.sort_order = 'name_asc'
  config.per_page = 15

  permit_params :first_name, :last_name, :phone_number, :password, :email

  filter :first_name_or_last_name_cont, as: :string, label: 'Full name'
  filter :phone_number
  filter :email
  filter :created_at
  filter :updated_at

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :phone_number
    column :email
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :email
      row :phone_number
      row :created_at
      row :updated_at
      row :avatar do
        cl_image_tag(resource&.avatar&.key, height: '350', crop: 'lfill')
      end
    end

    panel 'Appointments' do
      table_for resource.appointments do
        column :user do |a|
          link_to a.user.presenter.full_name, admin_user_path(a.user_id)
        end
        column :status do |a|
          a.presenter.status
        end
        column :recommendation
        column :started_at
        column :ended_at
        column :created_at
      end
    end
  end

  form do |f|
    f.inputs 'User details' do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :phone_number
      f.input :password
      f.input :avatar
    end

    f.actions
  end
end

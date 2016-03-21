ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :first_name, :last_name, :summoner_name, :birthdate

  index do
    column :first_name
    column :last_name
    column :email
    column :summoner_name
    column :birthdate
    actions
  end

  form do |f|
    f.inputs do
     f.input :first_name
     f.input :last_name
     f.input :email
     f.input :summoner_name
     f.input :birthdate, as: :date_select, :start_year    => 1920,
                                           :end_year      => Date.today.year
     f.input :password
     f.input :password_confirmation
    end
    f.actions
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :summoner_name
      row :birthdate
      row :email
    end
  end
end

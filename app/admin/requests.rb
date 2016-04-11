ActiveAdmin.register Request do
   index do
    column :id
    column :resume
    actions
  end

  filter :resume
  filter :authority_id
end

ActiveAdmin.register Preference do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :gender, :marital_status, :age, :interest
#
index do
  column :name
  column :age
  column :gender
  column :marital_status
  column :interest
  column :rule_category
  actions 
end

form do |f|
  f.inputs "Preferences" do
    f.input :name
    f.input :age
    f.input :gender, as: :select, collection:["male","female"]
    f.input :marital_status, as: :select, collection:["single", "married", "divorced"]
    f.input :interest, as: :select, collection:["active", "short-tempered", "relaxed", "quiet"]
  end
  f.actions
end

# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end

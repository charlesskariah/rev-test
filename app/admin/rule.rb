ActiveAdmin.register Rule do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :rule_type, facts_attributes: [:matcher, :subject, :predicate, :object, :rule_id]
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
index do
    column :name
    column :rule_type
    actions 
end

form do |f|
    f.inputs 'Rules' do
      f.input :name
      f.input :rule_type, as: :select, collection:["forall"]
    end
    f.inputs do
      f.has_many :facts, heading: 'Facts',
                              allow_destroy: true do |a|
        a.input :matcher, as: :select, collection:["has"]
        a.input :subject, as: :select, collection:["A"]
        a.input :predicate, as: :select, collection:["gender", "marital_status", "interest" ]
        a.input :object
      end
    end
    f.actions
  end
end

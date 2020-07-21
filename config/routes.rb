Rails.application.routes.draw do

  scope :controller => 'api', :path => 'equipment/api' do
    get 'get-equipment-list' => :get_equipment_list
    delete 'delete-equipment/:id' => :delete_equipment
    post 'add-equipment' => :add_equipment
    put 'update-equipment/:id' => :update_equipment
  end
  
  get 'api-test' => 'api#test'
  get 'add-equipment' => 'equipments#add'
  get 'rental' => 'equipments#rental'
  get 'list' => 'equipments#list'

  get '*path' => redirect('list')
  root :to => redirect('list')
end

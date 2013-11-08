WebGame2::Application.routes.draw do
  devise_for :users

  resources :cities
  
  match 'city/:id/travel' => 'cities#travel', :as => :travel_city
  
  resources :complexes
  
  resources :boxes
  
  match 'box/:id/open' => 'boxes#open', :as => :open_box
  match 'capsule' => 'boxes#buy', :as => :buy_box
  
  resources :fights
  
  match 'fight/:id/challenge' => 'fights#challenge', :as => :challenge_fight
  match 'fight/:id/defend' => 'fights#defend', :as => :defend_fight
  match 'fight/:id/dodge' => 'fights#dodge', :as => :dodge_fight
  match 'fight/:id/rest' => 'fights#rest', :as => :rest_fight
  match 'fight/:id/weapon_attack' => 'fights#weapon_attack', :as => :weapon_attack_fight
  match 'fight/:id/sidearm_attack' => 'fights#sidearm_attack', :as => :sidearm_attack_fight
  match 'fight/:id/parry' => 'fights#parry', :as => :parry_fight
  
  match 'fight/:id/result' => 'fights#result', :as => :result_fight
  
  resources :users, :module => :users
  
  resources :rooms
  
  match 'rooms/:id/guard' => 'rooms#guard', :as => :view_room_guard
  match 'guards/:id/assign' => 'rooms#change_guard', :as => :change_room_guard
  match 'guards/:id/unassign' => 'rooms#discard_guard', :as => :discard_room_guard
  match 'rooms/:id/pet' => 'rooms#pet', :as => :view_room_pet
  match 'pets/:id/assign' => 'rooms#change_pet', :as => :change_room_pet 
  match 'pets/:id/unassign' => 'rooms#discard_pet', :as => :discard_room_pet
  match 'rooms/:id/trap' => 'rooms#trap', :as => :view_room_trap
  match 'traps/:id/assign' => 'rooms#change_trap', :as => :change_room_trap 
  match 'traps/:id/unassign' => 'rooms#discard_trap', :as => :discard_room_trap
  
  match 'rooms/:id/furnishing' => 'rooms#furnishing', :as => :view_room_furnishing
  match 'furnishings/:id/assign' => 'rooms#add_furnishing', :as => :add_room_furnishing
  match 'furnishings/:id/unassign' => 'rooms#discard_furnishing', :as => :discard_room_furnishing
  
  match 'room/:id/buy' => 'rooms#buy', :as => :buy_room
  match 'room/:id/sell' => 'rooms#sell', :as => :sell_room
  
  resources :rings
  
  match 'rings/:id/buy' => 'rings#buy', :as => :buy_ring
  match 'rings/:id/equip' => 'rings#equip', :as => :equip_ring
  match 'rings/:id/unequip' => 'rings#unequip', :as => :unequip_ring
  match 'rings/:id/sell' => 'rings#sell', :as => :sell_ring
  
  resources :heads
  
  match 'heads/:id/buy' => 'heads#buy', :as => :buy_head
  match 'heads/:id/equip' => 'heads#equip', :as => :equip_head
  match 'heads/:id/unequip' => 'heads#unequip', :as => :unequip_head
  match 'heads/:id/sell' => 'heads#sell', :as => :sell_head
  
  resources :chests
  
  match 'chests/:id/buy' => 'chests#buy', :as => :buy_chest
  match 'chests/:id/equip' => 'chests#equip', :as => :equip_chest
  match 'chests/:id/unequip' => 'chests#unequip', :as => :unequip_chest
  match 'chests/:id/sell' => 'chests#sell', :as => :sell_chest
  
  resources :weapons
  
  match 'weapons/:id/buy' => 'weapons#buy', :as => :buy_weapon
  match 'weapons/:id/equip' => 'weapons#equip', :as => :equip_weapon
  match 'weapons/:id/unequip' => 'weapons#unequip', :as => :unequip_weapon
  match 'weapons/:id/sell' => 'weapons#sell', :as => :sell_weapon
  
  resources :sidearms
  
  match 'sidearms/:id/buy' => 'sidearms#buy', :as => :buy_sidearm
  match 'sidearms/:id/equip' => 'sidearms#equip', :as => :equip_sidearm
  match 'sidearms/:id/unequip' => 'sidearms#unequip', :as => :unequip_sidearm
  match 'sidearms/:id/sell' => 'sidearms#sell', :as => :sell_sidearm
  
  resources :legs
  
  match 'legs/:id/buy' => 'legs#buy', :as => :buy_leg
  match 'legs/:id/equip' => 'legs#equip', :as => :equip_leg
  match 'legs/:id/unequip' => 'legs#unequip', :as => :unequip_leg
  match 'legs/:id/sell' => 'legs#sell', :as => :sell_leg
  
  resources :boots
  
  match 'boots/:id/buy' => 'boots#buy', :as => :buy_boot
  match 'boots/:id/equip' => 'boots#equip', :as => :equip_boot
  match 'boots/:id/unequip' => 'boots#unequip', :as => :unequip_boot
  match 'boots/:id/sell' => 'boots#sell', :as => :sell_boot
  
  resources :hands
  
  match 'hands/:id/buy' => 'hands#buy', :as => :buy_hand
  match 'hands/:id/equip' => 'hands#equip', :as => :equip_hand
  match 'hands/:id/unequip' => 'hands#unequip', :as => :unequip_hand
  match 'hands/:id/sell' => 'hands#sell', :as => :sell_hand
  
  resources :guards
  
  match 'guards/:id/buy' => 'guards#buy', :as => :buy_guard
  match 'guards/:id/equip' => 'guards#equip', :as => :equip_guard
  match 'guards/:id/unequip' => 'guards#unequip', :as => :unequip_guard
  match 'guards/:id/sell' => 'guards#sell', :as => :sell_guard
  
  resources :traps
  
  match 'traps/:id/buy' => 'traps#buy', :as => :buy_trap
  match 'traps/:id/equip' => 'traps#equip', :as => :equip_trap
  match 'traps/:id/unequip' => 'traps#unequip', :as => :unequip_trap
  match 'traps/:id/sell' => 'traps#sell', :as => :sell_trap
  
  resources :pets
  
  match 'pets/:id/buy' => 'pets#buy', :as => :buy_pet
  match 'pets/:id/equip' => 'pets#equip', :as => :equip_pet
  match 'pets/:id/unequip' => 'pets#unequip', :as => :unequip_pet
  match 'pets/:id/sell' => 'pets#sell', :as => :sell_pet
  
  resources :furnishings
  
  match 'furnishings/:id/buy' => 'furnishings#buy', :as => :buy_furnishing
  match 'furnishings/:id/equip' => 'furnishings#equip', :as => :equip_furnishing
  match 'furnishings/:id/unequip' => 'furnishings#unequip', :as => :unequip_furnishing
  match 'furnishings/:id/sell' => 'furnishings#sell', :as => :sell_furnishing
  
  resources :list_guards
  resources :list_pets
  resources :list_traps
  resources :list_heads
  resources :list_hands
  resources :list_chests
  resources :list_rings
  resources :list_legs
  resources :list_boots
  resources :list_weapons
  resources :list_sidearms
  resources :colors
  
  
  root :to => 'users/users#show'
    
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

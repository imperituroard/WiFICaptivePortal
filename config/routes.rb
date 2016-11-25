Rails.application.routes.draw do

  namespace :lukoil_test do
    root :to => 'testt#testt_A_start_page'
    get 'testt/testt_A_start_page'
    get 'testt/testt_A_start_page' => 'testt#testt_A_start_page', as: 'testt_A_start_page'
    get 'testt/testt_check_msisdn_and_send_sms' => 'testt#testt_check_msisdn_and_send_sms', as: 'testt_check_msisdn_and_send_sms'
    get 'testt/testt_input_and_verify_code_success' => 'testt#testt_input_and_verify_code_success', as: 'testt_input_and_verify_code_success'
    get 'testt/testt_end_if_failed_auth_or_code_incorrect' => 'testt#testt_end_if_failed_auth_or_code_incorrect', as: 'testt_end_if_failed_auth_or_code_incorrect'
    # get 'belneft/Belneft_input_and_verify_code_success' => 'belneft#Belneft_input_and_verify_code_success', as: 'Belneft_input_and_verify_code_success'
    get 'testt/testt_put_code_again'  => 'testt#testt_put_code_again', as: 'testt_put_code_again'
    post '/' => 'testt#testt_check_msisdn_and_send_sms'
    post 'testt/testt_check_msisdn_and_send_sms'  => 'testt#testt_check_msisdn_and_send_sms'
    post 'testt/testt_input_and_verify_code'  => 'testt#testt_input_and_verify_code'
    post 'testt/testt_put_code_again'  => 'testt#testt_put_code_again'
  end

  namespace :portal_clientsversion do
    #root :to => 'lukoil#Lukoil_A_start_page'
    get 'lukoil/Lukoil_A_start_page'
  end

  namespace :portal_clientsversion do
    post 'belneft/Belneft_intro' => 'belneft#Belneft_intro'
    post 'belneft/Belneft_A_start_page' => 'belneft#Belneft_A_start_page'
    post 'belneft/Belneft_check_msisdn_and_send_sms'  => 'belneft#Belneft_check_msisdn_and_send_sms'
    post 'belneft/Belneft_input_and_verify_code'  => 'belneft#Belneft_input_and_verify_code'
    post 'belneft/Belneft_input_and_verify_code_success' => 'belneft#Belneft_input_and_verify_code_success'
    post 'belneft/Belneft_end_if_failed_auth_or_code_incorrect' => 'belneft#Belneft_end_if_failed_auth_or_code_incorrect'
    post 'belneft/Belneft_put_code_again'  => 'belneft#Belneft_put_code_again'

    post 'lukoil/Lukoil_A_start_page' => 'lukoil#Lukoil_A_start_page'
    post 'lukoil/Lukoil_check_msisdn_and_send_sms' => 'lukoil#Lukoil_check_msisdn_and_send_sms'
    post 'lukoil/Lukoil_input_and_verify_code' => 'lukoil#Lukoil_input_and_verify_code'
    post 'lukoil/Lukoil_end_if_failed_auth_or_code_incorrect' => 'lukoil#Lukoil_end_if_failed_auth_or_code_incorrect'
    post 'lukoil/Lukoil_input_and_verify_code_success' => 'lukoil#Lukoil_input_and_verify_code_success'
    post 'lukoil/Lukoil_put_code_again' => 'lukoil#Lukoil_put_code_again'

  end

  post '/portal_clientsversion/belneft/Belneft_A_start_page' => 'belneft#Belneft_A_start_page'
  post '/portal_clientsversion/lukoil/Lukoil_A_start_page' => 'lukoil#Lukoil_A_start_page'

  namespace :subscriber do
    root :to => 'subscribe#login'
    get 'subscribe/login'
  end

  namespace :engineer do
    root :to => 'engineering#open'
    get 'engineering/open'
    get 'engineering/open' => 'engineering#open', as: 'open'
    get 'engineering/add_ap_to_hub1' => 'engineering#add_ap_to_hub1'
  end



  get 'login/start'

  namespace :privateroom do
    get 'sessions/new'
    get 'private_room/Login'
  end



  namespace :admin do
    root :to => 'wi_fi_list_ap#newAP'
    get 'wi_fi_list_ap/newAP'
  end

 # get 'wi_fi_ap_list/newAP'

 # namespace :concerns do
 #   get 'wi_fiap_list/APnew'
  #end

 # get 'private_room/Login'

  #root :to => 'say_hello#MTS_A_start_page', :id => '1'
  root :to => 'login#start', :id => '2'
 # match '/engineer' => 'engineer#open', via: :all

  get 'say_hello/MTS_A_start_page' => 'say_hello#MTS_A_start_page', as: 'MTS_A_start_page'
  get 'say_hello/MTS_check_msisdn_and_send_sms' => 'say_hello#MTS_check_msisdn_and_send_sms', as: 'MTS_check_msisdn_and_send_sms'
  get 'say_hello/MTS_end_if_failed_auth_or_code_incorrect' => 'say_hello#MTS_end_if_failed_auth_or_code_incorrect', as: 'MTS_end_if_failed_auth_or_code_incorrect'
  get 'say_hello/MTS_input_and_verify_code_success' => 'say_hello#MTS_input_and_verify_code_success', as: 'MTS_input_and_verify_code_success'
  get 'say_hello/MTS_input_and_verify_code' => 'say_hello#MTS_input_and_verify_code', as: 'MTS_input_and_verify_code'
  get 'say_hello/put_code_again'  => 'say_hello#put_code_again'

  post '/' => 'say_hello#MTS_check_msisdn_and_send_sms'
  post 'say_hello/MTS_check_msisdn_and_send_sms'  => 'say_hello#MTS_check_msisdn_and_send_sms'
  post 'say_hello/MTS_input_and_verify_code'  => 'say_hello#MTS_input_and_verify_code'
  #get 'say_hello/MTS_A_start_page', to 'say_hello#MTS_A_start_page'
 # get '/portal', to: 'say_hello#MTS_A_start_page', as: 'start'

#
 #
 # get 'say_hello/MTS_check_msisdn_and_send_sms'
 # get 'say_hello/MTS_input_and_verify_code_success'
  #get 'say_hello/MTS_end_if_failed_auth_or_code_incorrect'

  get "*path" => redirect('/')

 # resources :sessions, :only => [:new, :create, :destroy]
 # resources :users
 # match '/contact', :to => "pages#contact"
 # match '/about',   :to => "pages#about"
 # match '/help',    :to => "pages#help"
#  match '/signup',  :to => "users#new"
 # match '/signin',  :to => "sessions#new"
 # match '/signup',  :to => "sessions#destroy"
 # root :to => "pages#home"







 # get 'goods/testgood'

 # get 'todo/index'

 # get 'send_sms/send'

 # get 'test/test'

 # get 'say_hello/SendSms'

  #post 'say_hello/verifycode' => 'say_hello#verifycode', as: 'verifycode'
  #post '' => 'say_hello#sendsms', as: 'sendsms'

  #post '' => 'say_hello#sum', as: 'sum'
  #post '' => 'say_hello#say', as: 'say'

  #root :to => 'SayHello#say', :as => 'SayHello'
  #map.root :SayHello#say => 'say'
 # get "*path" => redirect('/')


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  #resources :say_hello

  #namespace "admin" do
   # resources :goods
  #end
  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
Rails.application.routes.draw do

  root :to => 'say_hello#MTS_A_start_page', :id => '1'

  get 'say_hello/MTS_A_start_page'

  post '' => 'say_hello#MTS_check_msisdn_and_send_sms', as: 'MTS_check_msisdn_and_send_sms'
  post 'say_hello/MTS_input_and_verify_code_success' => 'say_hello#MTS_input_and_verify_code_success', as: 'MTS_input_and_verify_code_success'
  post 'say_hello/MTS_end_if_failed_auth_or_code_incorrect' => 'say_hello#MTS_end_if_failed_auth_or_code_incorrect', as: 'MTS_end_if_failed_auth_or_code_incorrect'
  get 'say_hello/MTS_check_msisdn_and_send_sms'
  get 'say_hello/MTS_input_and_verify_code_success'
  get 'say_hello/MTS_end_if_failed_auth_or_code_incorrect'
  get 'say_hello/put_code_again'









  get 'goods/testgood'

  get 'todo/index'

  get 'send_sms/send'

  get 'test/test'

  get 'say_hello/SendSms'

  post 'say_hello/verifycode' => 'say_hello#verifycode', as: 'verifycode'
  post '' => 'say_hello#sendsms', as: 'sendsms'

  #post '' => 'say_hello#sum', as: 'sum'
  #post '' => 'say_hello#say', as: 'say'

  #root :to => 'SayHello#say', :as => 'SayHello'
  #map.root :SayHello#say => 'say'


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

  resources :say_hello

  namespace "admin" do
    resources :goods
  end
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

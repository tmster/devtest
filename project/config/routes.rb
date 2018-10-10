Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :protected do
        get 'locations/:country_code', to: 'locations#index', constraints: { country_code: /[A-Z]{2}/ }
        get 'target_groups/:country_code', to: 'target_groups#index', constraints: { country_code: /[A-Z]{2}/ }
        post "evaluate_target", to: "target_groups#evaluate"
      end
      get 'locations/:country_code', to: 'locations#index', constraints: { country_code: /[A-Z]{2}/ }
      get 'target_groups/:country_code', to: 'target_groups#index', constraints: { country_code: /[A-Z]{2}/ }
    end
  end
  root controller: :pages, action: :root
end

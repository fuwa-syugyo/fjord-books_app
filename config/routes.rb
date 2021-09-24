Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ja/ do
    resources :books
  end

  get '/:locale' => 'books#index'
end

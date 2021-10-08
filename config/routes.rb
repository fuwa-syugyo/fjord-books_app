Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ja/ do
    get '/:locale' => 'books#index'
    resources :books
  end
end

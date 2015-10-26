VirtualSms::Engine.routes.draw do
  resources :messages, :path => '/', :only => [:index, :show] do
    member do
      get 'raw'
    end
    collection do
      delete 'clear'
    end
  end
end

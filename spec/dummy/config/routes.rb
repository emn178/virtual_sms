Rails.application.routes.draw do
  mount VirtualSms::Engine => "/virtual_sms"

  resources :messages, :path => '/', :only => [:index, :new, :create]
end

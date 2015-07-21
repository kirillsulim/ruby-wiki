Rails.application.routes.draw do
  get  'add' => 'pages#add'
  post 'add' => 'pages#create'
  get  '*path/add' => 'pages#add'
  post '*path/add' => 'pages#create'

  get  '*path/edit' => 'pages#edit'
  post '*path/edit' => 'pages#update'

  get '' => 'pages#view'
  get '*path' => 'pages#view'
end

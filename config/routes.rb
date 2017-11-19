Rails.application.routes.draw do
  resources 'posts'
  resources 'post_categories', except: [:index]
end

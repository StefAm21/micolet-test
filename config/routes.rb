Rails.application.routes.draw do
  scope '(:locale)', locale: /fr|es|de|pt|it/ do
    root 'subscribers#new'
    resources :subscribers, only: [:create]
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end

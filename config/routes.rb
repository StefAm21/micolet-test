Rails.application.routes.draw do
  scope '(:locale)', locale: /fr|es|de|pt|it/ do
    root 'subscribers#new'
    resources :subscribers, only: [:create] do
      get 'survey', on: :member
      get 'thanks', on: :member
    end
  end

  post 'typeform_webhook', to: "subscribers#typeform_webhook"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end

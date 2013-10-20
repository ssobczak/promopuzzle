Promopuzzle::Application.routes.draw do
  scope "api" do
    resources :images do
      resources :parts
    end

    resources :parts do
      get "exchange", on: :member
    end
  end

  root to: "main#index"
end

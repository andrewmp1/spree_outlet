SpreeOutlet::Engine.routes.draw do
   root to: "home#index"
   match '/outlet', to: redirect('/outlet/')
   match '/*path' => "home#index" #Need catchall. client side routing w/ history api still allows the browser to fetch on that url.

end

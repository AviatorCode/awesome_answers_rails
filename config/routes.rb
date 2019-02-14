Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # VERB     PATH    CONTROLLER NAME    PUBLIC METHOD IN CONTROLLER
  #ð        ð               ð          ð
  get("/hello_world", to: "welcome#hello_world")
  get("/", to: "welcome#home", as: :root)
  # When route has a "as" named argument, its value will be used as
  # the prefix the helpers.
  # - root_path -> "/"
  # - root_url -> "http://localhost:3000/"
  get("/contact_us", to: "welcome#contact_us")
  post("/process_contact", to: "welcome#process_contact")
  # When a route is created, Rails define some helper methods to
  # get the route's URL or PATH.
  # For the route above, two methods are created:
  #   - process_contact_path() -> "/process_contact"
  #   - process_contact_url() -> "http://localhost:3000/process_contact"
end

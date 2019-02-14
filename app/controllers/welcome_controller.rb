class WelcomeController < ApplicationController
  # Public methods of controller are called "actions."
  # They are responsible for generating the response
  # to a request.

  def hello_world
    # To send a response from a controller action,
    # use the `render` method.

    # When used with the `plain` named argument, it allows
    # to respond with plain text.
    render(plain: "Hello, World!")
  end

  def home
    # If you are rendering a template (view) named after the
    # action inside of the a directory named after the controller
    # within app/views/, then rails will automatically render
    # that without needing to call the `render` method.

    # In this case, `render :home` is optional we have
    # a view in `app/views/welcome/home.html.erb`
    # render :home
  end

  def contact_us
    render :contact_us
  end

  def process_contact
    # In Rails, all of Express' req.params, req.query and
    # req.body are combined into a single object, `params`.

    # The `params` is usuable as hash. It supports all hash methods.
    # res.send(req.params)

    # Use `render(json: params)` to take a object, transform into
    # JSON and respond with it. This very useful for debugging and
    # looking at the contents of an object.
    # render(json: params)

    # In Rails controllers, instance variables are available to
    # rendered templates.
    @full_name = params[:full_name]
    @email = params[:email]
    @message = params[:message]

    render :thank_you
  end
end

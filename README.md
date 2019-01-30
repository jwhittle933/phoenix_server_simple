Discuss List Application
==========================

[![Greenkeeper badge](https://badges.greenkeeper.io/jwhittle933/phoenix_server_simple.svg)](https://greenkeeper.io/)

Demo app from Udemy Elixir/Phonix course. Great boilerplate application for anyone just entering the Elixir world or who wants to see MVC from a functional paradigm. Below, you'll see how to clone, run, and alter the application for your own purposes. See the [Phoenix Docs](https://hexdocs.pm/phoenix/installation.html) for installing a project from scratch and advanced concepts. 

To grab this repo as boilerplate
  * `git clone https://github.com/jwhittle933/phoenix_server_simple.git`
  * Install dependencies with `mix deps.get`
  * Phoenix can be used with any SQL server, but the project as is uses postgres. To get postgres on your MacOS machine (if you don't already have it), run `brew update`, then `brew install postgres`. 
  * Read [this](http://exponential.io/blog/2015/02/21/install-postgresql-on-mac-os-x-via-brew/) page to make sure postgres is ready to go. 
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`. 
  * Start Phoenix endpoint with `mix phoenix.server`. This will launch the application as is. See below for instructions on how to strip this project to bare bones. 

Go to [`localhost:4000`](http://localhost:4000) from your browser to see the application running.

Strip to Server
---------------

At the root of the project, you'll notice a diretory named `web`. At the base of the web directory, open the `router.ex`. Below the initial `pipline` plugs, you'll see two `scope` definitions, one scoped to `"/"` and the other to `"/auth"`. 

	scope "/", Discuss do
	    pipe_through(:browser)

	    resources("/", TopicController)
	end

  	scope "/auth", Discuss do
	    pipe_through(:browser)

	    get("/signout", AuthController, :signout)
	    get("/:provider", AuthController, :request)
	    get("/:provider/callback", AuthController, :callback)
  	end 

The first scope uses a resource route to `"/"`, handled by the TopicController. This is RESTful shorthand, where each HTTP verb is connected to a controller method by convention. See the [docs](https://hexdocs.pm/phoenix/routing.html#resources) for a verbose explanation of RESTful api routing conventions. The TopicController can be found in [`web/controllers/topic_controller.ex`](https://github.com/jwhittle933/phoenix_server_simple/blob/master/web/controllers/topic_controller.ex). The is the principle controller for handling routing. Rename the file to fit your project (and don't forget change the controller declaration in `router.ex`), and set up the route functions to handle data and rendering according to your needs. 


You'll notice that each function in TopicController has RESTful naming conventions, i.e., `index`, `show`, `new`, etc. These names do not need to be changed, and in fact should probably be kept to maintain convention. You'll also notice that each function either renders or redirect to a template named after the method. These templates can be found in `web/templates/topic`. The final directory is named after the controller (a Phoenix convention). These are the html templates that you'll alter to your needs. 

This project comes with Materialize (CDN) and Bootstrap for quick styling. 

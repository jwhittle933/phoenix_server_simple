Discuss List Application
==========================

Demo app from Udemy Elixir/Phonix course. Great boilerplate application for anyone just entering the Elixir world. Below, you'll see how to clone, run, and alter the application for your own purposes. See the [Phoenix Docs](https://hexdocs.pm/phoenix/installation.html) for installing a project from scratch. 

To grab this repo as boilerplate
  * `git clone https://github.com/jwhittle933/phoenix_server_simple.git`
  * Install dependencies with `mix deps.get`
  * Phoenix can be used with any SQL server, but the project as is uses postgres. To get postgres on your machine (if you don't already have it), run `brew update`, then `brew install postgres`. 
  * Read [this](http://exponential.io/blog/2015/02/21/install-postgresql-on-mac-os-x-via-brew/) page to make sure postgres is ready to go. 
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`. 
  * Start Phoenix endpoint with `mix phoenix.server`. This will launch the application as is. See below for instructions on how to strip this project to bare bones. 

Go to [`localhost:4000`](http://localhost:4000) from your browser to see the application running.

Strip to Server
---------------

At the root of the project, you'll notice a diretory named `web`. At the base of the web directory, open the `router.ex`. Below the initial `pipline` plugs, you'll see two two `scope` definitions, one scoped to `"/"` and the other to `"/auth"`. 

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
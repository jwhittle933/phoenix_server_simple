defmodule Discuss.Plugs.RequireAuth do 
    import Plug.Conn
    import Phoenix.Controller

    alias Discuss.Router.Helpers

    def init(_params) do 
    end

    def call(conn, params) do 
        if conn.assigns[:user] do 
            conn
        else 
            conn
            |> put_flash(:error, "You must be logged in to access that feature.")
            |> redirect(to: Helpers.topic_path(conn, :index) )
            |> halt() #halts connection
        end
    end
end

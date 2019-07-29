defmodule WebServer do
  use Plug.Builder

  plug :redirect_index

  plug Plug.Logger

  plug Plug.Static,
    at: "/",
    from: :lolpoints
    
  plug Router

  def redirect_index(%Plug.Conn{path_info: path} = conn, _opts) do
    case path do
      [] ->
        %{conn | path_info: ["index.html"]}

      ["favicon.ico"] ->
        %{conn | path_info: ["favicon.ico"]}

      _ ->
        conn
    end
  end
end
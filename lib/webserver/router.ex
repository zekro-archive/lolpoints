defmodule Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/api/points/:uname" do
    send_resp(conn, 200, "#{uname}")
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
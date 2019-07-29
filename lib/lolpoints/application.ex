require Logger

defmodule LoLPoints.Application do

  use Application

  def start(_type, _argv) do
    cfg_file = System.get_env("CONFIG_FILE") || "config.yml"
    cfg = Conf.load!(cfg_file)

    port = System.get_env("PORT") || cfg["webserver"]["port"] || 8080
    port = if not is_integer(port) do
      case Integer.parse(port) do
        :error ->
          Utils.log_fatal("WEB SERVER :: port must be a number")
          
        { p, _ } -> p
      end
    else port end

    children = [
      Plug.Cowboy.child_spec(
        scheme: :http, 
        plug: WebServer, 
        options: [port: port]
      )
    ]

    Logger.info("WEB SERVER :: spawning on port #{port}")

    opts = [strategy: :one_for_one, name: LoLPoints.Supervisor]
    Supervisor.start_link(children, opts)
  end

end

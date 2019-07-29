require Logger

defmodule Conf do
  defp def_conf() do 
    """
    webserver:
      port: 8080

    riotapi:
      apikey: yoursecrethere
    """
  end

  def load!(file) do
    if not File.exists?(file) do
      Logger.error("CONFIG :: Config file was not found - creating default config at '#{file}'")
      case File.write(file, def_conf()) do
        {:err, err} ->
          Logger.error("CONFIG :: Failed creating default config file: #{err}")
        :ok -> 
          nil
      end
      Utils.log_fatal("shutting down")
    end

    case YamlElixir.read_all_from_file(file) do
      {:ok, data} ->
        data = data |> Enum.at(0)
        if data == nil do
          Utils.log_fatal("WEB SERVER :: port must be a number")
        end
        Logger.info("CONFIG :: initialized")
        data
    
      {:error, err} ->
        Utils.log_fatal("WEB SERVER :: port must be a number")
    end
  end
end
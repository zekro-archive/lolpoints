require Logger

defmodule Utils do
    
  def log_fatal(msg) do
    Logger.error(msg)
    :timer.sleep(10) # sleep 10ms to ensure error message was printed
    System.halt(1)
  end

end
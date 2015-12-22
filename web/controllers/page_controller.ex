defmodule PetObituary.PageController do
  use PetObituary.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

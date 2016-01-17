defmodule PetObituary.PageController do
  use PetObituary.Web, :controller

  alias PetObituary.User

  def index(conn, _params) do
  	changeset = User.changeset(%User{})
    render(conn, "index.html", changeset: changeset)
  end
end

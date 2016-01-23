defmodule PetObituary.PageView do
  use PetObituary.Web, :view

  def cookies(conn, cookie_name) do
	  conn.cookies[cookie_name]
	end

end

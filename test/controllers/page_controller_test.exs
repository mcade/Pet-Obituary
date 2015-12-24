defmodule PetObituary.PageControllerTest do
  use PetObituary.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Pet Obituary!"
  end
end

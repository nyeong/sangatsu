defmodule SangatsuWeb.ErrorViewTest do
  use SangatsuWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.html" do
    assert render_to_string(SangatsuWeb.ErrorView, "404.html", []) == "Not Found"
  end

  test "renders 500.html" do
    assert render_to_string(SangatsuWeb.ErrorView, "500.html", []) == "Internal Server Error"
  end
end

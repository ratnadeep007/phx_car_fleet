defmodule PhxPracticeWeb.CarControllerTest do
  use PhxPracticeWeb.ConnCase

  import PhxPractice.FleetFixtures

  @create_attrs %{manufacturer: "some manufacturer", model: "some model", reg_number: "some reg_number"}
  @update_attrs %{manufacturer: "some updated manufacturer", model: "some updated model", reg_number: "some updated reg_number"}
  @invalid_attrs %{manufacturer: nil, model: nil, reg_number: nil}

  describe "index" do
    test "lists all fleet_cars", %{conn: conn} do
      conn = get(conn, ~p"/fleet_cars")
      assert html_response(conn, 200) =~ "Listing Fleet cars"
    end
  end

  describe "new car" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/fleet_cars/new")
      assert html_response(conn, 200) =~ "New Car"
    end
  end

  describe "create car" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/fleet_cars", car: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/fleet_cars/#{id}"

      conn = get(conn, ~p"/fleet_cars/#{id}")
      assert html_response(conn, 200) =~ "Car #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/fleet_cars", car: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Car"
    end
  end

  describe "edit car" do
    setup [:create_car]

    test "renders form for editing chosen car", %{conn: conn, car: car} do
      conn = get(conn, ~p"/fleet_cars/#{car}/edit")
      assert html_response(conn, 200) =~ "Edit Car"
    end
  end

  describe "update car" do
    setup [:create_car]

    test "redirects when data is valid", %{conn: conn, car: car} do
      conn = put(conn, ~p"/fleet_cars/#{car}", car: @update_attrs)
      assert redirected_to(conn) == ~p"/fleet_cars/#{car}"

      conn = get(conn, ~p"/fleet_cars/#{car}")
      assert html_response(conn, 200) =~ "some updated manufacturer"
    end

    test "renders errors when data is invalid", %{conn: conn, car: car} do
      conn = put(conn, ~p"/fleet_cars/#{car}", car: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Car"
    end
  end

  describe "delete car" do
    setup [:create_car]

    test "deletes chosen car", %{conn: conn, car: car} do
      conn = delete(conn, ~p"/fleet_cars/#{car}")
      assert redirected_to(conn) == ~p"/fleet_cars"

      assert_error_sent 404, fn ->
        get(conn, ~p"/fleet_cars/#{car}")
      end
    end
  end

  defp create_car(_) do
    car = car_fixture()
    %{car: car}
  end
end

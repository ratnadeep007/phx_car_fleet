defmodule PhxPractice.FleetTest do
  use PhxPractice.DataCase

  alias PhxPractice.Fleet

  describe "fleet_cars" do
    alias PhxPractice.Fleet.Car

    import PhxPractice.FleetFixtures

    @invalid_attrs %{manufacturer: nil, model: nil, reg_number: nil}

    test "list_fleet_cars/0 returns all fleet_cars" do
      car = car_fixture()
      assert Fleet.list_fleet_cars() == [car]
    end

    test "get_car!/1 returns the car with given id" do
      car = car_fixture()
      assert Fleet.get_car!(car.id) == car
    end

    test "create_car/1 with valid data creates a car" do
      valid_attrs = %{manufacturer: "some manufacturer", model: "some model", reg_number: "some reg_number"}

      assert {:ok, %Car{} = car} = Fleet.create_car(valid_attrs)
      assert car.manufacturer == "some manufacturer"
      assert car.model == "some model"
      assert car.reg_number == "some reg_number"
    end

    test "create_car/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Fleet.create_car(@invalid_attrs)
    end

    test "update_car/2 with valid data updates the car" do
      car = car_fixture()
      update_attrs = %{manufacturer: "some updated manufacturer", model: "some updated model", reg_number: "some updated reg_number"}

      assert {:ok, %Car{} = car} = Fleet.update_car(car, update_attrs)
      assert car.manufacturer == "some updated manufacturer"
      assert car.model == "some updated model"
      assert car.reg_number == "some updated reg_number"
    end

    test "update_car/2 with invalid data returns error changeset" do
      car = car_fixture()
      assert {:error, %Ecto.Changeset{}} = Fleet.update_car(car, @invalid_attrs)
      assert car == Fleet.get_car!(car.id)
    end

    test "delete_car/1 deletes the car" do
      car = car_fixture()
      assert {:ok, %Car{}} = Fleet.delete_car(car)
      assert_raise Ecto.NoResultsError, fn -> Fleet.get_car!(car.id) end
    end

    test "change_car/1 returns a car changeset" do
      car = car_fixture()
      assert %Ecto.Changeset{} = Fleet.change_car(car)
    end
  end

  describe "drivers" do
    alias PhxPractice.Fleet.Driver

    import PhxPractice.FleetFixtures

    @invalid_attrs %{name: nil, phone: nil}

    test "list_drivers/0 returns all drivers" do
      driver = driver_fixture()
      assert Fleet.list_drivers() == [driver]
    end

    test "get_driver!/1 returns the driver with given id" do
      driver = driver_fixture()
      assert Fleet.get_driver!(driver.id) == driver
    end

    test "create_driver/1 with valid data creates a driver" do
      valid_attrs = %{name: "some name", phone: "some phone"}

      assert {:ok, %Driver{} = driver} = Fleet.create_driver(valid_attrs)
      assert driver.name == "some name"
      assert driver.phone == "some phone"
    end

    test "create_driver/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Fleet.create_driver(@invalid_attrs)
    end

    test "update_driver/2 with valid data updates the driver" do
      driver = driver_fixture()
      update_attrs = %{name: "some updated name", phone: "some updated phone"}

      assert {:ok, %Driver{} = driver} = Fleet.update_driver(driver, update_attrs)
      assert driver.name == "some updated name"
      assert driver.phone == "some updated phone"
    end

    test "update_driver/2 with invalid data returns error changeset" do
      driver = driver_fixture()
      assert {:error, %Ecto.Changeset{}} = Fleet.update_driver(driver, @invalid_attrs)
      assert driver == Fleet.get_driver!(driver.id)
    end

    test "delete_driver/1 deletes the driver" do
      driver = driver_fixture()
      assert {:ok, %Driver{}} = Fleet.delete_driver(driver)
      assert_raise Ecto.NoResultsError, fn -> Fleet.get_driver!(driver.id) end
    end

    test "change_driver/1 returns a driver changeset" do
      driver = driver_fixture()
      assert %Ecto.Changeset{} = Fleet.change_driver(driver)
    end
  end
end

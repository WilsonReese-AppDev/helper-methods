# require "test_helper"
require "application_system_test_case"

class DirectorTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit directors_url
    assert_selector "h1", text: "List of all directors"
  end

  test "visiting the new page" do
    visit new_director_url
    assert_selector "h1", text: "New director"
  end

  test "creating a director" do
    original_director_count = Director.count

    visit directors_url
    click_on "Add a new director"

    fill_in "Date of Birth", with: "04/14/2021"
    fill_in "Name", with: "A Director's Name"
    click_on "Create Director"

    assert_text "Director created successfully"
    
    ending_director_count = Director.count
    assert_equal original_director_count + 1, ending_director_count
  end

  test "can view show page" do
    @director = directors(:one)
    visit director_path(@director)
    assert_text "Director ##{@director.id} details"
  end

  test "can edit a director" do
    @director = directors(:one)
    visit director_path(@director)
    click_on "Edit director"
    fill_in "Name", with: "New name for edit test"
    fill_in "Date of Birth", with: "04/01/2021"

    click_on "Update Director"

    assert_text "Director updated successfully"

    @director.reload # I don't know what this does
    assert_equal "New name for edit test", @director.name
    assert_equal @director.dob, "Thu, 01 Apr 2021".to_date
  end 

  test "can delete a director" do
    @director = directors(:one)
    original_director_count = Director.count

    visit director_path(@director)
    click_on "Delete director"

    assert_text "Director deleted successfully"

    ending_director_count = Director.count
    assert_equal ending_director_count + 1, original_director_count
  end
end

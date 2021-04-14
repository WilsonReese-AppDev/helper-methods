require "application_system_test_case"
class MoviesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit movies_url
    assert_selector "h1", text: "List of all movies"
  end

  test "visiting the new page" do
    visit "/movies/new"
    assert_selector "h1", text: "New movie"
  end

  test "creating a Movie" do
    original_movie_count = Movie.count

    visit movies_url
    click_on "Add a new movie"

    fill_in "Description", with: "A new movie's descroption"
    fill_in "Title", with: "A new movie's title"
    click_on "Create Movie"

    assert_text "Movie created successfully"
    
    ending_movie_count = Movie.count
    assert_equal original_movie_count + 1, ending_movie_count
  end

  test "can view show page" do
    @movie = movies(:one)
    visit "/movies/#{@movie.id}"
    assert_text "Movie ##{@movie.id} details"
  end

  test "can edit a movie" do
    @movie = movies(:one)
    visit "/movies/#{@movie.id}"
    click_on "Edit movie"
    fill_in "Title", with: "New title for edit test"
    fill_in "Description", with: "New description for edit test"

    click_on "Update Movie"

    assert_text "Movie updated successfully"

    @movie.reload # I don't know what this does
    assert_equal "New title for edit test", @movie.title
    assert_equal @movie.description, "New description for edit test"
  end 

  test "can delete a movie" do
    @movie = movies(:one)
    original_movie_count = Movie.count

    visit "/movies/#{@movie.id}"
    click_on "Delete movie"

    assert_text "Movie deleted successfully"

    ending_movie_count = Movie.count
    assert_equal ending_movie_count + 1, original_movie_count
  end

  #checking to see if this commits


  # test "can show details of new movie from index" do
  #   visit movies_path
    
  #   click_on "Add a new movie"
  #   fill_in "Title", with: "Movie 1"
  #   fill_in "Description", with: "Movie 1 Description blah blah blah."
  #   click_on "Create movie"
  #   click_on ("Show details", match: :first)

  #   assert_text "Movie 1"
  # end
end
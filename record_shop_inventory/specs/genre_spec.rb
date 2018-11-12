require('minitest/autorun')
require('minitest/rg')

require_relative('../models/genre')

class GenreTest < MiniTest::Test

  def setup
    @genre = Genre.new({'id' => '1', 'genre_name' => 'Test_Genre'})
  end

  def test_genre_exists
    assert_equal(Genre, @genre.class)
  end

  def test_genre_can_have_id
    assert_equal(1, @genre.id)
  end

  def test_genre_has_name
    assert_equal('Test_Genre', @genre.genre_name)
  end

end

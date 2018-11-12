require('minitest/autorun')
require('minitest/rg')

require_relative('../models/genre_categorization')

class GenreCategorizationTest < MiniTest::Test

  def setup
    @genre_categorization = GenreCategorization.new({'id' => '1', 'record_id' => '2', 'genre_id' => '3'})
  end

  def test_genre_categorization_exists
    assert_equal(GenreCategorization, @genre_categorization.class)
  end

  def test_genre_categorization_can_have_id
    assert_equal(1, @genre_categorization.id)
  end

  def test_genre_categorization_has_record_id
    assert_equal(2, @genre_categorization.record_id)
  end

  def test_genre_categorization_has_genre_id
    assert_equal(3, @genre_categorization.genre_id)
  end

end

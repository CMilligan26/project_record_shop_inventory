require('minitest/autorun')
require('minitest/rg')

require_relative('../models/artist')

class ArtistTest < MiniTest::Test

  def setup
    @artist = Artist.new({'id' => '1', 'artist_name' => 'Test_Artist'})
  end

  def test_artist_exists
    assert_equal(Artist, @artist.class)
  end

  def test_artist_can_have_id
    assert_equal(1, @artist.id)
  end

  def test_artist_has_name
    assert_equal('Test_Artist', @artist.artist_name)
  end

end

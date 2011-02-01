require 'test_helper'

class PossessifyTest < ActiveSupport::TestCase
  test "string not ending in s possessive" do
    assert_equal "Dave's", "Dave".possessive
  end
  
  test "string ending in s possessive" do
    assert_equal "James'", "James".possessive
    assert_equal "JameS'", "JameS".possessive
  end
  
  test "string already possessive" do
    assert_equal "Dave's", "Dave's".possessive
    assert_equal "James'", "James'".possessive
  end
  
  test "short string" do
    assert_equal "D's", "D".possessive
    assert_equal "S'", "S".possessive
  end
  
  test "blanks string" do
    assert_equal "", "".possessive
  end
  
  test "possesive string non_possesive" do
    assert_equal "Dave", "Dave's".non_possessive
  end
  
  test "plural possesive string non_possesive" do
    assert_equal "James", "James'".non_possessive
    assert_equal "JameS", "JameS'".non_possessive
  end
  
end

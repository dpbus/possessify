require 'test_helper'

class PossessifyTest < ActiveSupport::TestCase

  # tests for possessive method
  test "should make singular string possessive" do
    assert_equal "Dave's", "Dave".possessive
  end
  
  test "should make string ending in s possessive" do
    assert_equal "Xerxes'", "Xerxes".possessive
    assert_equal "XerxeS'", "XerxeS".possessive
  end
  
  test "should make single character string possesive" do
    assert_equal "D's", "D".possessive
    assert_equal "S'", "S".possessive
  end
  
  test "should do nothing if string already possessive" do
    assert_equal "Dave's", "Dave's".possessive
    assert_equal "Xerxes'", "Xerxes'".possessive
  end
  
  test "should do nothing if string is empty" do
    assert_equal "", "".possessive
  end
  
  # tests for non_possessive method
  test "should make singular possessive string non-possesive" do
    assert_equal "Dave", "Dave's".non_possessive
  end
  
  test "should make possesive string ending in s non_possesive" do
    assert_equal "Xerxes", "Xerxes'".non_possessive
    assert_equal "XerxeS", "XerxeS'".non_possessive
  end
  
  # tests for possessive? method
  test "should return true for possessive string" do
    assert_equal true, "Dave's".possessive?
    assert_equal true, "Xerxes'".possessive?
  end
  
  test "should return false for non-possessive string" do
    assert_equal false, "Dave".possessive?
    assert_equal false, "Xerxes".possessive?
  end
  
end

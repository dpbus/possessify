require 'test_helper'

describe Possessify do

  describe "#possessive" do
    it "should make singular string possessive" do
      "Dave".possessive.must_equal "Dave's"
    end

    it "should make string ending in s possessive" do
      "Xerxes".possessive.must_equal "Xerxes'"
      "XerxeS".possessive.must_equal "XerxeS'"
    end

    it "should make single character string possesive" do
      "D".possessive.must_equal "D's"
      "S".possessive.must_equal "S'"
    end

    it "should do nothing if string already possessive" do
      "Dave's".possessive.must_equal "Dave's"
      "Xerxes'".possessive.must_equal "Xerxes'"
    end

    it "should do nothing if string is empty" do
      "".possessive.must_equal ""
    end
  end

  describe "#non_possessive" do
    it "should make singular possessive string non-possesive" do
      "Dave's".non_possessive.must_equal "Dave"
    end

    it "should make possesive string ending in s non_possesive" do
      "Xerxes'".non_possessive.must_equal "Xerxes"
      "XerxeS'".non_possessive.must_equal "XerxeS"
    end
  end

  describe "#possessive?" do
    it "should return true for possessive string" do
      "Dave's".possessive?.must_equal true
      "Xerxes'".possessive?.must_equal true
    end

    it "should return false for non-possessive string" do
      "Dave".possessive?.must_equal false
      "Xerxes".possessive?.must_equal false
    end
  end
end

require 'spec_helper'
include PagesHelper

describe PagesHelper do
  describe "recursive_tree" do
    it "should form three" do
      p1 = Page.new(title: 'p1', full_name: 'p1')
      p2 = Page.new(title: 'p2', full_name: 'p2')
      p3 = Page.new(title: 'p3', full_name: 'p3')
      ar = {p1 => {p2 => {p3 => {} }}}
      expect(recursive_tree(ar)).to eq("<li><a href='/p1'>p1</a><ul><li><a href='/p2'>p2</a><ul><li><a href='/p3'>p3</a><ul></ul></li></ul></li></ul></li>")
    end

    it "should process empty hash" do
      expect(recursive_tree({})).to eq("")
    end

    it "shold process one level hash" do
      p = Page.new(title: 'p', full_name: 'p')
      ar = {p => {} }
      expect(recursive_tree(ar)).to eq("<li><a href='/p'>p</a><ul></ul></li>")
    end
  end
end

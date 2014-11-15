require 'spec_helper'

RSpec.describe "Board" do 
  it "should instantiate" do 
    expect(Board.new).to be_kind_of(Board)
  end
  it "should be the specified size" do 
    expect(Board.new(25).size).to eq 25
  end
  
  subject { Board.new(25) }
  
  it "should generate a cells array" do 
    expect(subject.cells.class).to eq Array
  end
  
  it "should initialize with cells" do
    expect(subject.cells.first).to be_kind_of(Cell)
  end
end

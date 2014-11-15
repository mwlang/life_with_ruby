require 'spec_helper'

RSpec.describe "Cell" do 
  let(:board) do 
    b = Board.new(40) 
    b.cells[1].alive = true
    b
  end
  
  it "should instantiate" do 
    expect(Cell.new(board, 0, 0, false)).to be_kind_of(Cell)
  end
  
  let(:cell00) { board.cells[0] }
  let(:cell01) { board.cells[1] }
  
  subject { cell00 }
  
  it "should be dead" do 
    expect(subject.alive?).to eq false
  end
  
  it "should be alive" do 
    expect(cell01.alive?).to eq true
  end
  
  it "can see its neighbors" do 
    expect(cell00.neighbors).to eq [cell01]
  end
  
  it "can get the cell at 0,1" do 
    expect(board.cell_at(0,1).inspect).to eq "Cell[0,1]"
  end
  
  it "can get the cell at 5,5" do 
    expect(board.cell_at(5,5).inspect).to eq "Cell[5,5]"
  end
    
  it "has correct cell coordinates at 5th spot" do
    expect(board.cells[30].inspect).to eq "Cell[0,30]"
  end

  let(:all_alive_board) do
    b = Board.new 
    b.cells.each{|cell| cell.alive = true}
    b
  end
  
  it "finds nine neighors for middle of grid cell" do 
    expect(all_alive_board.cell_at(5,5).neighbors.count).to eq 8
  end
  
  it "finds 5 neighbors on top row cells" do 
    expect(all_alive_board.cell_at(0,5).neighbors.count).to eq 5
  end
end

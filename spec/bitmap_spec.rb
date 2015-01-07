require 'bitmap'
require 'pry'

describe "command input" do
  context "valid commands" do
    it "should accept terminate session command" do
      terminate_with_X = is_valid_command? "X"
      expect( terminate_with_X ).to be true
    end

    it "should accept valid commands" do
    end
  end

  context "invalid command" do
    it "should reject an invalid argument" do
      invalid_arg = is_valid_command? "E"
      expect( invalid_arg ).to be false
    end
  end
end

describe "initialise matrix" do
  context "has dimensions m x n" do
    it "should have all pixels coloured white" do
      m = 5 #col
      n = 4 #row

      bitmap = Bitmap.new m, n
      expect(bitmap.table.select{|e| (e==0)}.count).to eq(m*n)
    end
  end
end

describe "clear the table" do
  it "should set all pixels to white" do
    col = 5
    row = 6

    bitmap = Bitmap.new col, row
    bitmap.clear
    expect(bitmap.table).to eq(
      Matrix[
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0]
      ]
    )
  end
end

describe "colouring" do
  it "should be able to change pixel colour" do
    x,y,c = 1,2,3
    bitmap = Bitmap.new 2, 3

    # Colours the pixel (x,y) with colour c
    bitmap.colour( x,y,c )

    # expect colouring func to account for origin offset
    expect(bitmap.table.element(y-1, x-1)).to eq(c)
  end
end

describe "origin of coordinates" do
  it "should start at 1,1" do
    bitmap = Bitmap.new 5, 6

    # colour pixel at 'origin'
    bitmap.colour(1,1,3)

    # expect true origin to have been changed
    expect(bitmap.table.element(0,0)).to eq(3)
  end
end

describe "painting with colour C" do
  context "vertical segment" do
    it "should draw in column X between rows Y1 and Y2" do
      col = 5
      row = 6

      x, y1, y2, c = 2, 3, 4, 9

      bitmap = Bitmap.new col, row
      bitmap.draw_vertical_segment( x, y1, y2, c )

      expect( bitmap.table ).to eq(
        Matrix[
          [0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0],
          [0, 9, 0, 0, 0],
          [0, 9, 0, 0, 0],
          [0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0]
        ]
      )
    end
  end
end

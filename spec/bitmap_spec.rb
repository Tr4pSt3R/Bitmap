require 'bitmap'

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
    col = 3
    row = 2
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

  context "horizontal segment" do
    it "should draw in row Y between columns X1 and X2" do
      col = 5
      row = 6

      x1, x2, y, c = 3, 4, 2, 9

      bitmap = Bitmap.new col, row
      bitmap.draw_horizontal_segment( x1, x2, y, c )

      expect( bitmap.table ).to eq(
        Matrix[
          [0, 0, 0, 0, 0],
          [0, 0, 9, 9, 0],
          [0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0]
        ]
      )
    end
  end

  context "region filling" do
    it "should colour any pixel which is the same colour as (x,y)" do
      col = 5
      row = 6

      x, y, c = 3, 3, 9

      bitmap = Bitmap.new col, row
      bitmap.fill_region(x,y,c)

      expect( bitmap.table ).to eq(
        Matrix[
          [9, 9, 9, 9, 9],
          [9, 9, 9, 9, 9],
          [9, 9, 9, 9, 9],
          [9, 9, 9, 9, 9],
          [9, 9, 9, 9, 9],
          [9, 9, 9, 9, 9]
        ]
      )
    end
  end
end

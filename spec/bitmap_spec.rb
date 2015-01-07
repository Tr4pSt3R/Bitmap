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
      matrix = bitmap.I([m,n])
      expect(matrix.select{|e| (e==0)}.count).to eq(m*n)
    end
  end
end

describe "clear the table" do
  it "should set all pixels to white" do
    bitmap = Bitmap.new 5, 6
    bitmap.clear
    expect( bitmap.table ).to eq( Matrix.zero(5,6) )
  end
end

describe "colouring" do
  it "should be able to change pixel colour" do
    x,y,c = 1,2,3
    bitmap = Bitmap.new 2, 3
    bitmap.colour( x,y,c )
    expect(bitmap.table.element(x,y)).to eq(c)
  end
end

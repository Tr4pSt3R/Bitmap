require 'bitmap'

describe "command input" do
  context "valid commands" do
    it "should accept terminate session command" do
      terminate_with_X = is_valid_command? "X"
      expect( terminate_with_X ).to be true
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
        matrix = I 4 5
      expect( matrix[0,0] ).to eq( 0 )
    end
  end
end

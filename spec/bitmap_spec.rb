require 'bitmap'

describe "command input" do
  context "valid commands" do
    it "should accept terminate session command" do
      terminate_with_X = is_valid_command? "X"
      expect( terminate_with_X ).to be true
    end
  end
end

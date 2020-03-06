require "towers"
require "rspec"

describe TowerGame do
  let(:tower_inst) { TowerGame.new(3) }
  # tower_inst = TowerGame.new

  describe "#initialize" do
    it "should initialize 2 empty stacks"
      expect(tower_inst.pole2).to be_empty
      expect(tower_inst.pole3).to be_empty

    it "should initialize a stack with n disks"
      expect(tower_inst.pole1).to eq([3,2,1])
  end

  describe "#move" do
    it "should only make the move if it is valid"
      expect(tower_inst).to receive(:valid_input)
    it "should move the disk"
      expect(tower_inst.pole1).to eq([3,2,1])
      tower_inst.move(1, 3)
      expect(tower_inst.pole1).to eq([3,2])
      expect(tower_inst.pole3).to eq([1])  
  end

  describe "#valid_input" do 
    context "should return false if " do
      it " from_pole is empty"
        expect(tower_inst.valid_input(2, 1)).to be_false
      it "from_pole doesn't exist"
        expect(tower_inst.valid_input(4, 1)).to be_false
      it "to_pole doesn't exist"
        expect(tower_inst.valid_input(2, 4)).to be_false
      it "disk on to_pole is smaller than from_pole"
        tower_inst.move(1, 3)
        expect(tower_inst.valid_input(1, 3)).to be_false
    end

    context "should return true" do
      
      it "if the move is valid"
        expect(tower_inst.valid_input(1, 3)).to be_true
    end
  end

  describe "#ask_user" do
    it "should ask the user for input"

    it "should return the users input"

    it "calls the method #valid_input"
  end

  describe "#won?" do
    it "returns true if pole 2 or 3 have all the disks"

    it "returns false if the user hasnt won"
  end

  describe "#game" do
    it "calls function #ask_user"

    it "calls method #move"

    it "calls method #valid_input"

    it "calls method #won?"
  end
end
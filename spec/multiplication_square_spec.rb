require 'spec_helper'
require 'psquare/multiplication_square'

describe MultiplicationSquare do

  describe "Creation" do
    subject { MultiplicationSquare.new((1..12).to_a) }
    it "builds the correct grid" do
      subject.grid.last.first.should equal(12)
      subject.grid.last.last.should equal(144)
    end
  end

  describe "Api" do
    subject { MultiplicationSquare.new((1..12).to_a) }
    it { should respond_to :display }
    it { should respond_to :axes  }
    it { should respond_to :grid  }
  end

  describe "Printing" do
    let(:console) { mock 'STDOUT' }
    subject { MultiplicationSquare.new((1..3).to_a, console) }
    it 'writes the result to STDOUT' do
      console.should_receive(:puts)
      subject.display
    end
    it 'writes the column headings' do
      console.should_receive(:puts).with(/^\s+1\s+2\s+3/)
      subject.display
    end
    it 'writes the grid' do
      console.should_receive(:puts).with(/9\s*$/)
      subject.display
    end
  end
  
end

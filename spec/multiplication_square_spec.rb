require 'spec_helper'
require './lib/multiplication_square'

describe MultiplicationSquare do

  before(:each) do
    @console = mock('STDOUT')
    #@console = mock('STDOUT')
    subject { MultiplicationSquare.new(@console) }
  end
  
  describe "Printing" do
    it { should respond_to :print }
    it 'writes the result to STDOUT' do
      subject.print
      @console.should_receive(:puts)
    end
  end
  
end

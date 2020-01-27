require 'spec_helper'
require_relative '../calculate'


describe '#to_numbers' do
  let(:calculate) { Calculate.new }
  let(:subject) { calculate.to_numbers(input) }

  context 'when input is valid numbers in string' do
    let(:input) { 'one two three' }
    it { expect(subject).to eq([1,2,3]) }
  end

  context 'when there are invalid characters' do
    let(:input) { 'abc cde' }
    it { expect(subject).to eq([]) }
  end
end

describe '#check_valid_array' do
  let(:calculate) { Calculate.new }
  let(:subject) { calculate.check_valid_array(input) }

  context 'when array is empty' do
    let(:input) { [] }
    it { expect(subject).to be_falsey }
  end

  context 'when there are invalid integers' do
    let(:input) { [1,2,3,'4'] }
    it { expect(subject).to be_falsey }
  end

  context 'when input contains all valid integer' do
    let(:input) { [1,2,3,4] }
    it { expect(subject).to be_truthy }
  end
end

describe '#computate_average' do
  let(:calculate) { Calculate.new }
  let(:subject) { calculate.computate_average(input) }

  context 'return digit if array contains single digit' do
    let(:input) { [8] }
    it { expect(subject).to eq(8) }
  end

  context 'returns the average of array with size 2' do
    let(:input) { [1, 3] }
    it { expect(subject).to eq(2) }
  end

  context 'returns the average of array with size 3' do
    let(:input) { [1, 3, 2] }
    it { expect(subject).to eq(2) }
  end
end

describe '#calculate_average' do
  let(:calculate) { Calculate.new }
  let(:subject) { calculate.calculate_average(input) }

  context 'with valid input' do
    let(:input) { 'one two three four five' }
    it { expect(subject).to eq('three') }
  end

  context 'with empty input' do
    let(:input) { '' }
    it { expect(subject).to eq('n/a') }
  end

  context 'with invalid input' do
    let(:input) { 'absaddadadadano 12313( (*!@#' }
    it { expect(subject).to eq('n/a') }
  end
end
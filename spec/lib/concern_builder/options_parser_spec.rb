require 'spec_helper'

describe ConcernBuilder::OptionsParser do
  let(:clazz) { described_class::Dummy }
  let(:switched) { true }
  let(:options) { { switch: switched, option_1: 'value1', option_2: 2} }

  subject do
    clazz.new(options)
  end

  it 'enables the given options to be acced' do
    expect(subject.the_method).to eq('The value is value1')
  end

  context 'when changing the options' do
    let(:switched) { false }

    it 'enables the given options to be acced' do
      expect(subject.the_method).to eq('The value is not value1 but 2')
    end
  end

  context 'when there is an option missing' do
    let(:options) { { option_1: 'value1', option_2: 2} }

    it do
      expect(subject.the_method).not_to raise_error
    end

    it 'considers is to be nil' do
      expect(subject.the_method).to eq('missing option')
    end
  end
end
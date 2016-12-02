# frozen_string_literal: true
require 'spec_helper'

describe Release::OurVersion do
  subject { described_class.new '1.2.3' }

  describe '#succ' do
    it 'returns the successor' do
      expect(subject.succ.to_s).to eq 'v1.2.4'
    end
  end
end

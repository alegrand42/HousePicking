require 'rails_helper'

RSpec.describe House, type: :model do
  context 'House Model' do
    subject { create(:house) }

    it 'is not empty' do
      expect(subject.name).not_to be_empty
    end
  end
end

require 'rails_helper'
describe Favorite, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
  end

  describe 'validations' do
    it { should validate_presence_of :location}
    it { should validate_presence_of :user_id}
  end
end

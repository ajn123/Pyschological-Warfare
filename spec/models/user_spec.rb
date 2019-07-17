# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'requires email correctly' do
      user = User.new(name: 'AJ', email: 'bob@aol.com')
      user.valid?
      expect(user.errors).to be_empty
    end

    it 'requires email correctly' do
      user = User.new(name: 'AJ', email: 'bobol.com')
      user.valid?
      expect(user.errors).not_to be_empty
    end

    it 'requires presence correctly' do
      user = User.new(name: '', email: '')
      user.valid?
      expect(user.errors).not_to be_empty
    end

    it 'requires Name presence correctly' do
      user = User.new(name: '', email: 'bob@aol.com')
      user.valid?
      expect(user.errors).not_to be_empty
    end
  end
end

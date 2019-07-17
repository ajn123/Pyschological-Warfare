# frozen_string_literal: true

require 'rails_helper'
require 'factories/article'

# This will guess the User class
FactoryBot.define do
  factory :article do
    title { 'Headed for extinction' }
    author  { 'Gale Bradbrook' }
    content { 'We are in the sixth mass extinction' }
  end
end

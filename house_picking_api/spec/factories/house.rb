# frozen_string_literal: true

FactoryBot.define do
  factory :house do
    name { 'Appmnt' }
    agency { 'Immo' }
    room { 3 }
    disponibility { 'a vendre' }
  end
end

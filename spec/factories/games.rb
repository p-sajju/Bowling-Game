# spec/factories/games.rb

FactoryBot.define do
  factory :game do
    rolls { [] }
    status { 'in_progress' }
  end
end

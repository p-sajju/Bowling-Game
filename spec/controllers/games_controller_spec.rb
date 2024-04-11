require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'POST #create' do
    it 'starts a new game' do
      post :create
      expect(response).to have_http_status(:success)
      expect(Game.count).to eq(1)
    end
  end

  describe 'POST #roll' do
    let(:game) { create(:game) }

    it 'submits a roll' do
      post :roll, params: { id: game.id, pins: 7 }
      expect(response).to have_http_status(:success)
      game.reload
      expect(game.rolls).to include(7)
    end

    it 'returns error for invalid number of pins' do
      post :roll, params: { id: game.id, pins: -1 }
      expect(response).to have_http_status(:bad_request)
    end
  end

  describe 'GET #score' do
    let(:game) { create(:game, rolls: [3, 5, 10, 7, 3, 6, 2]) }

    it 'returns the current game score' do
      get :score, params: { id: game.id }
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['score']).to eq(52)
    end
  end
end

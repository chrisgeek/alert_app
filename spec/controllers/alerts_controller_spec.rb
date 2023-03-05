require 'rails_helper'

RSpec.describe AlertsController, type: :request do
  let(:user) { create :user }
  let(:alert_url) { '/alerts' }
  let(:valid_attributes) do
    {
      description: 'Initial release',
      origin: '172.89.34.0',
      tag: ['version_2', 'staging'],
      type: 'portal_opened'
    }
  end
  before :each do
    login_with_api user
  end

  describe 'GET index' do
    before { get alert_url }

    it 'returns 200' do
      expect(response.status).to eq(200)
    end
  end

  describe 'POST create' do
    before { post alert_url, params: { alert: valid_attributes } }

    it { expect(response.status).to eq(201) }
  end
end

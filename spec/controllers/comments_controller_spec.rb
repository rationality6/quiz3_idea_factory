require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe '#create' do
    context 'with no signed in user' do
      it 'redirects to root path' do
        post :create, params: { amount: 10, campaign_id: campaign.id }
        expect(response).to redirect_to root_path
      end
    end

    context 'with signed in user' do
      before { request.session[:user_id] = user.id }

      context 'with valid attributes' do
        def valid_request
          post :create, params: { pledge:      { amount: 20 },
                                  campaign_id: campaign.id }
        end

        it 'creates a pledge in the database' do
          count_before = Pledge.count
          valid_request
          count_after = Pledge.count
          expect(count_after).to eq(count_before + 1)
        end

        it 'redirect to the campaign show page' do
          valid_request
          expect(response).to redirect_to(campaign_path(campaign))
        end

        it 'associates the created pledge with the logged in user' do
          valid_request
          expect(Pledge.last.user).to eq(user)
        end

        it 'associates the created pledge with the campaign' do
          valid_request
          expect(Pledge.last.campaign).to eq(campaign)
        end
      end

      context 'with invalid attributes' do
        def invalid_request
          post :create, params: { pledge: { amount: nil },
                                  campaign_id: campaign.id }
        end

        it "doesn't create pledge in the database" do
          count_before = Pledge.count
          invalid_request
          count_after = Pledge.count
          expect(count_before).to eq(count_after)
        end

        it 'renders the campagin show template' do
          invalid_request
          expect(response).to render_template('campaigns/show')
        end
      end
    end
  end

end

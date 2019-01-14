require 'rails_helper'

RSpec.describe Contributor::CollaboratorsController, type: :controller do

	before(:each) do |skip|
		session[:collaborator_id] = create(:collaborator).id
		unless skip.metadata[:skip_before]
			@collaborator = create(:collaborator)
		end
	end
  let(:valid_attributes) {
		{
			name: Faker::Lorem.name,
			email: Faker::Internet.email,
      password: '123456',
      password_confirmation: '123456',
		}
	}
	context "actions" do
		it { is_expected.to use_before_action(:set_item) }

	  describe "GET #new" do
	    it "returns http success" do
	      get :new
	      expect(response).to be_success if session[:collaborator_id].blank?
	    end
	  end

	  describe "GET #edit" do
	    it "returns http success" do
	      get :edit, params: {id: @collaborator.id}
	      expect(response).to be_success
	    end
	  end
	end

	context "Post #create", :skip_before do
		it "#create new Collaborator" do
			expect {
					post :create, params: {collaborator: valid_attributes}
				}.to change(Collaborator, :count).by(1)

		end

		it "redirects after create collaborator" do
			post :create, params: {collaborator: valid_attributes}
			expect(response).to redirect_to(contributor_collaborator_profile_path)
		end

		it "#create with invalid params" do
			post :create, params: {
				collaborator: {
					name: 'jo',
					description: ''
				}
			}
			expect(response).to render_template("new")
		end
	end

	context "PUT #update", :skip_before do
		email = Faker::Internet.email
		let(:new_attributes) {
			{
					email: email
			}
		}

		it "updates the requested collaborator" do
			collaborator = create(:collaborator)
			put :update, params: {id: collaborator.id, collaborator: new_attributes}
			collaborator.reload
			expect(Collaborator.last.email).to eq(email)
		end

		it "redirects to the collaborator" do
			collaborator = create(:collaborator)
			put :update, params: {id: collaborator.id, collaborator: new_attributes}
			expect(response).to redirect_to(contributor_collaborator_profile_path)
		end

		it "with invalid params" do
			collaborator = create(:collaborator)
			put :update, params: {
				id: collaborator.id, collaborator: {
					email: nil
				}
			}
			expect(response).to render_template("edit")
		end
	end

	context "#destroy" do
		it "#destroy is deleted and redirect_to" do
				delete :destroy, params: {id: @collaborator.id}
				expect(response).to redirect_to(root_path)
				expect(controller).to set_flash[:notice]
		end
		it "#destroy is deleted to true" do
					expect{
					delete :destroy, params: {id: @collaborator.id}
				}.to change(Collaborator,:count).by(-1)
		end

	end
end

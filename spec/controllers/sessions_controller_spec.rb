require 'spec_helper'
describe SessionsController do 
	describe "#create" do 

		it "logs in a user" do 
			@request.env['omniauth.auth'] = {
				info: { name: 'Chirag' },
				uid: 'ABCD123',
				provider: 'twitter'
			}
			post :create
			user = User.find_by_uid_and_provider('ABCD123', 'twitter')
			expect(controller.current_user.id).to eq(user.id)
		end

		it "logs in an existing user" do
			@request.env['omniauth.auth'] = {
				info: { name: 'Chirag' },
				uid: 'ABCD123',
				provider: 'twitter'
			}
			user = User.create(name: 'Chirag', uid: "ABCD123", provider: 'twitter')
			post :create
			expect(User.count).to eq(1)
			expect(controller.current_user.id).to eq(user.id)
		end

		it "redirects to companies page" do 
			@request.env['omniauth.auth'] = {
				info: { name: 'Chirag' },
				uid: 'ABCD123',
				provider: 'twitter'
			}
			post :create
			expect(response).to redirect_to(root_path)
		end

	end
end
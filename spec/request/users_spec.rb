require 'rspec/rails'

RSpec.describe 'Users', type: :request do
    describe "GET /index" do
        it "Renders a successful response" do
            get "/"
            expect(response).to have_http_status(:success)
            expect(response.body).to include("List of all users in the database")
        end
    end

    describe "GET /show" do
        it "Renders a successful response" do
            get "/users/:id"
            expect(response).to have_http_status(:success)
            expect(response.body).to include("Show a specific user from the database")
        end
    end
end
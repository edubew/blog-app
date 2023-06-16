require 'rspec/rails'

RSpec.describe 'Posts', type: :request do
    describe "GET /index" do
        it "Renders a successful response" do
            get posts_path
            expect(response).to have_http_status(:success)
            expect(response.body).to include("A list of all posts for a given user")
        end
    end

    describe "GET /show" do
        it "Renders a successful response" do
            get "/posts/:id"
            expect(response).to have_http_status(:success)
            expect(response.body).to include("A specific post from the database")
        end
    end
end
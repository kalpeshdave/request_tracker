require 'rails_helper'

RSpec.describe CatchAllController, type: :controller do
	describe "GET index" do
		it "should render index template if proxy false" do
			get :index, { params: { proxy: 'false' } }
			controller.params[:proxy].should_not be_nil
			expect(response).to render_template("index")
		end

		it "should redirect if proxy true" do
			get :index, { params: { proxy: 'true' } }
			controller.params[:proxy].should_not be_nil
			expect(response).to redirect_to("https://www.mocky.io/v2/5185415ba171ea3a00704eed/?proxy=true")
		end

		it "matches with enqueued job if proxy true" do
	    ActiveJob::Base.queue_adapter = :test
	    expect {
	      RecordPingJob.perform_later
	    }.to have_enqueued_job(RecordPingJob)
	  end
	end
end

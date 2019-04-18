require 'rails_helper'

RSpec.describe RecordPingJob, type: :job do
	include ActiveJob::TestHelper

	subject(:job) { described_class.perform_later(original_url: "http://example.com", type: "lite") }

	it 'queues the job' do
    expect { job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it "matches with enqueued job" do
    ActiveJob::Base.queue_adapter = :test
    expect {
      RecordPingJob.perform_later
    }.to have_enqueued_job(RecordPingJob)
  end

  it 'is in default queue' do
    expect(RecordPingJob.new.queue_name).to eq('default')
  end
end

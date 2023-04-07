require 'rails_helper'

RSpec.describe ScrapGoogleResultJob, type: :job do
  include ActiveJob::TestHelper

  subject(:job) { described_class.perform_later }

  it 'queues the job' do
    expect { job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'is in medium queue' do
    expect(ScrapGoogleResultJob.new.queue_name).to eq('default')
  end

  it { is_expected.to be_processed_in :default }

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end
end

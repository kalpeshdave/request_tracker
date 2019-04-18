class RecordPingJob < ApplicationJob
  queue_as :default

  def perform(params={})
  	params = params.to_h.transform_keys(&:to_sym)

    ping = Ping.new(original_url: params[:original_url], type: params[:type], app_id: params[:app_id])
  	begin
			ping.save!
		rescue ActiveRecord::RecordInvalid => invalid
		  ping.errors = ping.errors.messages
		  ping.save(validate: false)
		end
  end
end

class CatchAllController < ApplicationController
  def index
  	if params[:proxy].eql?('true')
  		RecordPingJob.perform_later(
  			original_url: request.original_url, 
  			type: params[:type], 
  			app_id: params[:app_id])
  		
  		redirect_to generate_url(request.parameters.except(:controller, :action, :path))
  	end
  end

  private
  def generate_url(params = {})
	  uri = URI("https://www.mocky.io/v2/5185415ba171ea3a00704eed/")
	  uri.query = params.to_query
	  uri.to_s
	end
end

class Ping < ApplicationRecord
	store :query_params, accessors: [ :type, :app_id ]
	store :errors

	# Database-backed attributes

	validates :original_url, presence: true

	# query_params stored attributes

	validates :type, presence: true, inclusion: { in: ['static', 'lite', 'dynamic'] }
	validates :app_id, presence: true, numericality: { only_integer: true }
end

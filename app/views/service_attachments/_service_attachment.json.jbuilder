json.extract! service_attachment, :id, :service_id, :picture, :created_at, :updated_at
json.url service_attachment_url(service_attachment, format: :json)

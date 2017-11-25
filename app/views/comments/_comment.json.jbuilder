json.extract! comment, :id, :user_id, :unity_id, :content, :ups, :downs, :created_at, :updated_at
json.url comment_url(comment, format: :json)

json.extract! comment, :id, :created_at
json.content Sanitize.fragment(comment.content, Sanitize::Config::RELAXED)
json.user do
  json.extract! comment.user, :name, :nickname, :image
  json.progress do
    json.extract! comment.user.progress, :level, :xp
  end
end

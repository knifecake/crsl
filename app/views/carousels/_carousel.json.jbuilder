json.extract! carousel, :id, :title, :user_id, :created_at, :updated_at
json.posters carousel.posters do |poster|
  json.extract! poster, :title
  json.background_url poster.background.url
end

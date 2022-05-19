json.array! @posts do |post|
  json.imageSrc url_for(post.image)
  json.title post.title
  json.note post.note
end
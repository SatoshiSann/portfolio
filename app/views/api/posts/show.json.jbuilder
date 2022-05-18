json.extract! @post, :title, :note, :url
json.image_stc url_for(@post.image)
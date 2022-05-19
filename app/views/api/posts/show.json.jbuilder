json.extract! @post, :title, :note, :url
json.imageSrc url_for(@post.image)
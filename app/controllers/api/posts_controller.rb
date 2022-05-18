class Api::PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @posts = [{id: 1}, {id: 2}]
    render :index, formats: [:json]
  end

  def create
    @post = Post.new post_params
    image_name = SecureRandom.hex

    blob = ActiveStorage::Blob.create_and_upload!(
      io: File.open(create_png(image_name)),
      filename: "#{image_name}.png",
      content_type: 'png'
    )

    @post.image.attach(blob)
    @post.save!

    render :show, formats: [:json]
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :url, :note)
  end

  def create_png(image_name)
    height = 100
    width = 100
    png = ChunkyPNG::Image.new(height, width, ChunkyPNG::Color::TRANSPARENT)
    height.times do |h|
      width.times do |w|
        rgba_hash = random_rgba_hash
        png[h, w] = ChunkyPNG::Color.rgba(rgba_hash[:r], rgba_hash[:g], rgba_hash[:b], rgba_hash[:a])
      end
    end
    png.save("tmp/storage/#{image_name}.png", :interlace => true)
    "tmp/storage/#{image_name}.png"
  end

  def random_rgba_hash
    {
      r: rand(255),
      g: rand(255),
      b: rand(255),
      a: rand(255)
    }
  end
end

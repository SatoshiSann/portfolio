class Api::PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @posts = Post.with_attached_image.order(created_at: :desc)
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
    height = 250
    width = 250
    png = ChunkyPNG::Image.new(height, width, ChunkyPNG::Color::TRANSPARENT)
    pixel_colors = Array.new(height, Array.new(width))
    reset_percent = rand(30)
    height.times do |h|
      width.times do |w|
        rgba_hash = random_rgba_hash(h, w, pixel_colors, reset_percent)
        pixel_colors[h][w] = rgba_hash
        png[h, w] = ChunkyPNG::Color.rgba(rgba_hash[:r], rgba_hash[:g], rgba_hash[:b], rgba_hash[:a])
      end
    end
    png.save("tmp/storage/#{image_name}.png", :interlace => true)
    "tmp/storage/#{image_name}.png"
  end

  def random_rgba_hash(h, w, pixel_colors, reset_percent = 20)
    random_value = 20
    color = pixel_colors[h - rand(3)][w - rand(3)]
    color = nil if rand(100) < reset_percent
    if color
      {
        r: not_overflowing(color[:r], rand(-random_value..random_value)),
        g: not_overflowing(color[:g], rand(-random_value..random_value)),
        b: not_overflowing(color[:b], rand(-random_value..random_value)),
        a: not_overflowing(color[:b], rand(random_value)),
      }
    else
      {
        r: rand(255),
        g: rand(255),
        b: rand(255),
        a: 255
      }
    end
  end

  def not_overflowing(value, add, target_max = 255, target_min = 0)
    return value - add if value + add > target_max || value + add < target_min

    value + add
  end
end

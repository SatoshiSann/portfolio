class Api::PostsController < ApplicationController
  def index
    @posts = [{id: 1}, {id: 2}]
    render :index, formats: [:json]
  end
end

class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "photo_templates/index" })
  end

  def show
    # Parameters: {"path_id"=>"777"}
    url_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => url_id })

    @the_photo = matching_photos.at(0)

    render({ :template => "photo_templates/show" })
  end

  def destroy
    the_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.at(0)

    the_photo.destroy

    # render({ :template => "photo_templates/delete" })

    redirect_to("/photos")
  end

  def create
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    post = Photo.new

    post.image = input_image
    post.caption = input_caption
    post.owner_id = input_owner_id

    post.save

    redirect_to("/photos")
    # render({ :template => "photo_templates/create" })
  end

  def update
    the_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => the_id })

    post = matching_photos.first

    post.image = params.fetch("input_image")
    post.caption = params.fetch("input_caption")

    post.save

    redirect_to("/photos/#{post.id}")

    # render({ :template => "photo_templates/update" })

  end

end

class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index" })
  end

  def show
    # Parameters: {"path_username"=>"anisa"}
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.first

    if @the_user == nil
      @the_user = User.new

      @the_user.username = url_username

      @the_user.save
    end

    render({ :template => "user_templates/show" })
  end

  def search
    username = params.fetch("the_username")

    redirect_to("/users/#{username}")

  end

  def update
    the_id = params.fetch("path_id")

    matching_users = User.where({ :id => the_id })

    the_user = matching_users.first

    the_user.username = params.fetch("updated_username")

    the_user.save

    redirect_to("/users/#{the_user.username}")
  end
end

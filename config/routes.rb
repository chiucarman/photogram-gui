Rails.application.routes.draw do

  get("/users", { :controller => "users", :action => "index" })

  get("/users/:path_username", { :controller => "users", :action => "show" })

  post("/enter_user", { :controller => "users", :action => "search" })

  post("/update_username/:path_id", { :controller => "users", :action => "update" })

  get("/photos", { :controller => "photos", :action => "index" })

  get("/photos/:path_id", { :controller => "photos", :action => "show" })

  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy" })

  get("/create_post", { :controller => "photos", :action => "create" })

  post("/update_photo/:path_id", { :controller => "photos", :action => "update" })

  post("/insert_comment", { :controller => "photos", :action => "comment" })
end

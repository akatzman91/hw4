class EntriesController < ApplicationController
  def index
    @entries = Entry.where({ "user_id" => session["user_id"] })
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry.uploaded_image.attach(params["uploaded_image"])
    @entry["place_id"] = params["place_id"]
    @entry["user_id"] = @current_user["id"]
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

end

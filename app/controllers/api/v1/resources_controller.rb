class Api::V1::ResourcesController < ApplicationController
	  def resources
			app_id = params["id"]
			app = App.find_by(id:app_id)
			if app == nil
				render json:{message:"指定されたアプリが見つかりません"}
			else
				characters = []
				markers = []
				app.companies.each{|c|
					characters.concat c.characters.pluck_to_hash(:id, :name, :thumbnail_url, :asset_url, :updated_at)
					markers.concat c.markers.pluck_to_hash(:id, :image_url, :updated_at)
				}
				render json:{characters:characters, markers:markers}
			end
	  end
end

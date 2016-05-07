class Api::V1::AppsController < ApplicationController
	include JSONError
	protect_from_forgery with: :null_session
	skip_before_filter :verify_authenticity_token
  def resources
		app_id = params["id"]
		app = App.find_by(id:app_id)
		if app == nil
			render_error "指定されたアプリが見つかりません"
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

	def impressions
		app_id = params["id"]
		user = User.find_by(uuid:params["uuid"])
		unless user
			render_error "指定されたユーザが存在しません"
			return
		end
		save_params = {}
		save_params[:user_id] = user.try(:id)
		[:marker_id, :character_id, :advertising_id, :latitude, :longitude].each{|k|
			save_params[k] = params[k].presence
		}
		save_params[:displayed_at] = Time.now
		impl = Impression.create(save_params)
		if impl.invalid?
			render_error "パラメータが不足しています"
			return
		end
		render json:nil
	end

	def reaches
		app_id = params["id"]
		user = User.find_by(uuid:params["uuid"])
		unless user
			render_error "指定されたユーザが存在しません"
			return
		end
		save_params = {}
		save_params[:user_id] = user.try(:id)
		[:marker_id, :character_id, :advertising_id, :latitude, :longitude].each{|k|
			save_params[k] = params[k].presence
		}
		save_params[:displayed_at] = Time.now
		reach = Reach.create(save_params)
		if reach.invalid?
			render_error "パラメータが不足しています"
			return
		end
		render json:nil
	end
end

class Api::V1::AppsController < ApplicationController
	include JSONError
	protect_from_forgery with: :null_session
	skip_before_filter :verify_authenticity_token


  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'

      render :text => '', :content_type => 'text/plain'
    end
	end


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

		unless Marker.find_by(id:save_params[:marker_id])
			render_error "指定されたマーカが存在しません"
			return
		end
		unless Character.find_by(id:save_params[:character_id])
			render_error "指定されたキャラクタが存在しません"
			return
		end
		unless Advertising.find_by(id:save_params[:advertising_id])
			render_error "指定された広告が存在しません"
			return
		end

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
		unless Marker.find_by(id:save_params[:marker_id])
			render_error "指定されたマーカが存在しません"
			return
		end
		unless Character.find_by(id:save_params[:character_id])
			render_error "指定されたキャラクタが存在しません"
			return
		end
		unless Advertising.find_by(id:save_params[:advertising_id])
			render_error "指定された広告が存在しません"
			return
		end
		reach = Reach.create(save_params)
		if reach.invalid?
			render_error "パラメータが不足しています"
			return
		end
		render json:nil
	end
end

class Api::V1::MarkersController < ApplicationController
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

  def results
		marker_id = params["id"]
		marker = Marker.find_by(id:marker_id)
		if marker == nil
			render_error "指定されたマーカーが見つかりません"
		else
			characters = marker.company.characters
			if characters.size == 0
				render_error "キャラクターが見つかりません"
			else
				advertisings = marker.company.advertisings
				if advertisings.size == 0
					render_error "広告が見つかりません"
				else
					adv = advertisings.sample
					render json:{character_id:characters.sample.id, advertising_id:adv.id, image_url:adv.image_url, link_url:adv.link_url}
				end
			end
		end
  end
end

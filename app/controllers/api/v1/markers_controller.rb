class Api::V1::MarkersController < ApplicationController
	include JSONError
	protect_from_forgery with: :null_session
	skip_before_filter :verify_authenticity_token
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

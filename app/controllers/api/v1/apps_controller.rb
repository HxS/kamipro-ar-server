class Api::V1::AppsController < ApplicationController
  include JSONError
  protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token

  before_action :set_app
  before_action :check_app_version


  def resources
    characters = []
    markers = []
    advertisings = []
    @app.companies.where(enabled:true).each{|c|
      characters.push c.character.attributes.select{|k,v| [:id, :name, :updated_at].include? k.to_sym}
      markers.concat c.markers.where(enabled:true).pluck_to_hash(:id, :name, :target_id, :updated_at)
      c.markers.each{|m|
        m.advertisings.where(enabled:true).each{|adv|
          advertisings.push ({id:adv.id, image:adv.image.url, link:adv.link, updated_at:adv.updated_at})
        }
      }
    }
    render json:{characters:characters, markers:markers, advertisings:advertisings}
  end

  def relations
    rels = []
    @app.companies.where(enabled:true).each{|c|
      character_id = c.character.id
      c.markers.where(enabled:true).each{|m|
        advertisings = m.advertisings.where(enabled:true).pluck(:id)
        rels.push({marker_id:m.id, character_id: character_id, advertisings:advertisings})
      }
    }
    render json:rels
  end

  def impressions
    user = User.find_by(uuid:params["uuid"])
    unless user
      render_error "指定されたユーザが存在しません"
      return
    end
    save_params = {}
    save_params[:user_id] = user.try(:id)
    [:advertising_id, :latitude, :longitude].each{|k|
      save_params[k] = params[k].presence
    }
    save_params[:displayed_at] = Time.now
    save_params[:app_id] = @app.id

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
    user = User.find_by(uuid:params["uuid"])
    unless user
      render_error "指定されたユーザが存在しません"
      return
    end
    save_params = {}
    save_params[:user_id] = user.try(:id)
    [:advertising_id, :latitude, :longitude].each{|k|
      save_params[k] = params[k].presence
    }
    save_params[:displayed_at] = Time.now
    save_params[:app_id] = @app.id
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

private
  def set_app
    app_id = params["id"]
    @app = App.find_by(id:app_id)
    unless @app
      render_error "指定されたアプリが見つかりません"
      return false
    end
  end
  def check_app_version
    android_app_version = request.headers["X-KAMIPRO-ANDROID-VERSION"]
    ios_app_version = request.headers["X-KAMIPRO-IOS-VERSION"]
    if android_app_version
      if @app.android_version == "" || Gem::Version.new(android_app_version) < Gem::Version.new(@app.android_version)
        render_error "アプリを更新してください", 412
        return false
      end
    elsif ios_app_version
      if @app.ios_version == "" || Gem::Version.new(ios_app_version) < Gem::Version.new(@app.ios_version)
        render_error "アプリを更新してください", 412
        return false
      end
    else
      render_error "パラメータが不足しています"
      return false
    end
  end
end

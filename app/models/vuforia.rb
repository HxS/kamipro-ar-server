class Vuforia
  class << self
    def upload(marker)
      begin
        path = marker.image.url
        size = FastImage.size(path)

        name = "marker"+marker.id.to_s
        #advertisings = marker.advertisings.where(enabled:true).pluck(:id)
        #meta = ({marker_id:marker.id, character_id: marker.company.character.id, advertisings:advertisings}).to_json
        meta = marker.id

        if marker.target_id
          connection.update_target(marker.target_id, name, path, size[0], if marker.enabled then 1 else 0 end, meta)
        else
          res = connection.add_target(name, path, size[0], if marker.enabled then 1 else 0 end, meta)
          marker.target_id = (JSON.parse res)["target_id"]
          marker.save!
        end
        true
      rescue => e
        false
      end
    end

    def delete(target_id)
      connection.delete_target target_id
    end

    def connection
      Vws::Api.new(Rails.application.config.vuforia_access_key, Rails.application.config.vuforia_secret_key)
    end
  end
end

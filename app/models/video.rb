class Video < ApplicationRecord

    # before_save :extract_video_id
    belongs_to :dojo, optional: true

    def self.extract_video_id(videoUrl)
        yotubeIdRegex = /(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/ ]{11})/
        matchId = yotubeIdRegex.match(videoUrl)[1]
        if matchId != nil
            logger.debug "Youtube video id: #{matchId}"
            return matchId
        else
            logger.debug "Error! Youtube id not Found"
            return nil
        end
    end
end

import Graph

enum VideoFields : String {
    case title = "title"
    case presenterName = "presenter_name"
    case description = "description"
    case thumbnailURL = "thumbnail_url"
    case videoURL = "video_url"
    case videoDuration = "video_duration"
}


extension Entity {

    public var title : String? {
        get
        {
            return self[VideoFields.title.rawValue] as? String
        }

        set
        {
            self[VideoFields.title.rawValue] = newValue
        }
    }

    public var presenterName : String? {
        get
        {
            return self[VideoFields.presenterName.rawValue] as? String
        }

        set
        {
            self[VideoFields.presenterName.rawValue] = newValue
        }
    }

    public var videoDescription : String? {
        get
        {
            return self[VideoFields.description.rawValue] as? String
        }

        set
        {
            self[VideoFields.description.rawValue] = newValue
        }
    }

    public var thumbnailURL : String? {
        get
        {
            return self[VideoFields.thumbnailURL.rawValue] as? String
        }

        set
        {
            self[VideoFields.thumbnailURL.rawValue] = newValue
        }
    }

    public var videoURL : String? {
        get
        {
            return self[VideoFields.videoURL.rawValue] as? String
        }

        set
        {
            self[VideoFields.videoURL.rawValue] = newValue
        }
    }

    public var videoDuration : Int? {
        get
        {
            return self[VideoFields.videoDuration.rawValue] as? Int
        }

        set
        {
            self[VideoFields.videoDuration.rawValue] = newValue
        }
    }
    

}

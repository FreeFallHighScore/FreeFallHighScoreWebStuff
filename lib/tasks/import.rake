desc "import youtube videos. this should be run often. just not too often."
task :import_youtube_videos => :environment do |e|
  raise "HELL" unless ENV["YOUTUBE_DEV_TAG"] and ENV["YOUTUBE_DEV_KEY"]

  base_url = "https://gdata.youtube.com/feeds/api/videos/?#{ENV["YOUTUBE_DEV_TAG"]}&key=#{ENV["YOUTUBE_DEV_KEY"]}"

  url = base_url + "&max-results=50&alt=jsonc&v=2"

  start = 1
  items = 0
  total = 50

  while (start + items) < total
    start += items
    my_url = url + "&start-index=#{start}"

    doc = open(my_url)
    data = ActiveSupport::JSON.decode(doc)["data"]

    items = data["itemsPerPage"]
    start = data["startIndex"]
    total = data["totalItems"]

    data["items"].each do |v|
      next if !Video.find_by_youtube_id(v["id"]).nil?
      video = Video.new :youtube_id => v["id"],
        :title => v["title"],
        :description => v["description"],
        :author => v["uploader"],
        :published_at => v["uploaded"],
        :length => v["duration"]

      v["developerTags"].each do |cat|
        case cat
        when "freefallhighscore"
        when /dur:(.*)$/
          video.drop_time = $1
        when /loc:(.+)$/
          video.location = $1
        when /dev:(.+)$/
          video.device = $1
        end
      end

      unless video.save
        STDERR.puts "THERE WAS AN ERROR SAVING #{video.inspect}"
      end
    end
  end
end

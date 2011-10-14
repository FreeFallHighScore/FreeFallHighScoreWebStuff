namespace :video do
  desc "remove all video objects in db"
  task :remove => :environment do |e|
    Video.all.each do |v|
      v.destroy
    end
  end

  desc "import youtube videos. this should be run often. just not too often."
  task :import => :environment do |e|
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
          :length => v["duration"],
          :disabled => false

        v["developerTags"].each do |cat|
          case cat
            #"developerTags":
            #  [
            #    "freefallhighscore",
            #    "dur:0.684336",
            #    "lat:+40.714452",
            #    "lon:-73.936149",
            #    "mak:iPhone",
            #    "sys:iPhone OS",
            #    "ver:4.3"
            #],
          when "freefallhighscore"
          when /dur:(.*)$/
            video.drop_time = $1
          when /lat:(.+)$/
            video.latitude = $1
          when /lon:(.+)$/
            video.longitude = $1
          when /mak:(.+)$/
            video.make = $1
          when /sys:(.+)$/
            video.system = $1
          when /ver:(.+)$/
            video.version = $1
          else
            STDERR.puts "A tag found that isn't supported!: #{cat}"
          end
        end

        unless video.save
          STDERR.puts "THERE WAS AN ERROR SAVING #{video.inspect}"
        end
      end
    end

    Video.rank
  end
end

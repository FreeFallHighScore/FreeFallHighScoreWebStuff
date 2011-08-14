desc "import youtube videos. this should be run often. just not too often."
task :import_youtube_videos => :environment do |e|
  url = ENV["VIDEO_QUERY_STRING"] + "&max-results=50"

  raise "HELL" unless ENV["VIDEO_QUERY_STRING"]
  url = ENV["VIDEO_QUERY_STRING"] + "&max-results=50&alt=jsonc&v=2"
  #url = "https://gdata.youtube.com/feeds/api/videos/?q=freefallhighscore&key=AI39si7H3MXz-tQpyTjyqa5BnHlNVqVWB9YAubils0HqAbETSafztzK1-_nGM5pg5Lv9xcATljHho5VCEP40lnm-kjWRvVNxZQ&max-results=5&alt=jsonc&v=2"

  start = 1
  items = 0
  total = 50

  output_string = ""

  while (start + items) < total
    start += items
    my_url = url + "&start-index=#{start}"
    puts "URL: #{my_url}"

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
        puts "THERE WAS AN ERROR SAVING #{video.inspect}"
      end
    end
  end

  puts output_string
end

namespace :townhall do desc "Create a meeting from the following video"
  task :import, :url, :meeting_date, :needs => :environment do |t, args|
    WORKING_DIRECTORY = File.join(Rails.root, "tmp", "transcode")

    puts "Creating working directory #{WORKING_DIRECTORY}"
    FileUtils.mkdir_p(WORKING_DIRECTORY)

    puts "Downloading #{args.url}"
    VIDEO_FILE = File.join(WORKING_DIRECTORY, "meeting")
    start_time = Time.now.to_i
    unless File.exists? VIDEO_FILE
      Meeting.fetch(args.url, VIDEO_FILE)
    else
      puts "Using cached file 'meeting' in #{WORKING_DIRECTORY}"
    end
    stop_time = Time.now.to_i
    puts "Download Complete [#{stop_time - start_time}s]"

    puts "Transcoding"
    WEBM_VIDEO_FILE = File.join(WORKING_DIRECTORY, "meeting.webm")
    start_time = Time.now.to_i
    unless File.exists? WEBM_VIDEO_FILE
      Meeting.transcode(VIDEO_FILE, WEBM_VIDEO_FILE)
    else
      puts "Using cached file 'meeting.webm' in #{WORKING_DIRECTORY}"
    end
    stop_time = Time.now.to_i
    puts "Transcoding Complete [#{stop_time - start_time}s]"

    meeting = Meeting.remote_create(args.meeting_date)
    puts "New meeting #{meeting["meeting_date"]} created"

    puts "Uploading"
    start_time = Time.now.to_i
    Meeting.upload(meeting["url"], WEBM_VIDEO_FILE)
    stop_time = Time.now.to_i
    puts "Upload complete [#{stop_time - start_time}s]"

    FileUtils.rm_r(WORKING_DIRECTORY)
  end

  task :import_tags, :url, :meeting_id, :needs => :environment do |t, args|
    puts "Downloading #{args.url}"
    tags = Tag.fetch(args.url)

    puts "Saving"
    tags.each do |tag|
      tag[:meeting_id] = args.meeting_id
      Tag.remote_create(tag)
    end
  end
end

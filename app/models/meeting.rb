class Meeting < ActiveRecord::Base
  validates_presence_of :url
  validates_presence_of :meeting_date

  validates_format_of :url, :with => URI.regexp

  def self.fetch(url, file)
    uri = URI(url)
    Net::HTTP.get_response(uri) do |response|
      File.open(file, "w") do |f|
        response.read_body do |chunk|
          f.write(chunk)
        end
      end
    end
  end

  def self.transcode(source, result)
    `ffmpeg -i #{source} #{result}`
  end

  def self.remote_create(meeting_date)
    data = { :meeting => { :meeting_date => meeting_date } }
    new_meeting_url = TownhallConfig.base_url + "/meetings/"
    HTTParty.post(new_meeting_url, :body => data, :headers => {"Accept" => "application/json"})["meeting"]
  end

  def self.upload(url, filename)
    s3_key = "/"+URI.parse(url).path.split('/', 3)[2]
    AWS::S3::S3Object.store(s3_key, open(filename), TownhallConfig.s3_bucket, :access => :public_read)
  end

  def meeting_date=(meeting_date)
    write_attribute(:meeting_date, meeting_date)
    generate_url
  end

protected
  def generate_url
    uid = rand(36**8).to_s(36)
    self.url = "http://s3.amazonaws.com/#{TownhallConfig.s3_bucket}/meetings/#{meeting_date}/#{uid}.webm"
  end
end

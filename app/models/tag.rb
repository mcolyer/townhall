class Tag < ActiveRecord::Base

  def self.remote_create(attributes)
    data = { :tag => attributes, :auth_token => TownhallConfig.system_user_token }
    new_tag_url = TownhallConfig.base_url + "/tags/"
    HTTParty.post(new_tag_url, :body => data, :headers => {"Accept" => "application/json"})["tag"]
  end

  def self.fetch(url, method=:create_tags_from_granicus_player)
    html = Net::HTTP.get_response(URI(url)).body
    self.send(method, html)
  end

  # Public: Parses the Granicus player HTML for meeting segment information.
  # It's currently used in a dropdown in their web player. However they have
  # convieniently included the number of seconds in the html and the labels
  # right next to it.
  #
  # Returns a list of hashes representing tag attributes sorted by start time.
  def self.create_tags_from_granicus_player(html)
    doc = Nokogiri::HTML(html)

    tags = doc.css('#IndexDropdown option').map do |item|
      _,time = item['value'].split(':')
      next unless time

      {:name => item.content, :start => time}
    end.compact

    # Set the stop time to the next item
    tags.each_slice(2) do |ts|
      t1, t2 = ts
      if t2
        t1[:stop] = t2[:start]
      else
        t1[:stop] = t1[:start]
      end
    end

    tags
  end
end

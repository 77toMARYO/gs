require 'json'
require 'open-uri'
module UsersHelper
  def commits
=begin
    content = open("https://api.github.com/users/77toMARYO/events").read
    json_data = JSON.parse(content)

    #datetime = DateTime.new(2014, 7, 30, 0, 0, 0)
    
    commits = 0
    json_data.each do |list| 
      if list["type"] == "PushEvent" 
        created = DateTime.parse(list["created_at"])
        if @user.created_at < created
          
          commits += 1
        end
      end
    end
    commits
=end
    commits = 25
  end
end

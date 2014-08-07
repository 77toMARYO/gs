require 'json'
require 'open-uri'

class TestController < ApplicationController
  def view
    content = open("https://api.github.com/users/77toMARYO/events").read
    json_data = JSON.parse(content)

    datetime = DateTime.new(2014, 7, 30, 0, 0, 0)
    @user.used_point = 0
    json_data.each do |list| 
      if list["type"] == "PushEvent" 
        created = DateTime.parse(list["created_at"])
        if datetime < created
          
          @user.used_point += 1
        end
      end
    end
  end
end

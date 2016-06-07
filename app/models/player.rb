class Player < ActiveRecord::Base
  has_many :game_stats
  has_one :overall_stat

  def get_stats
    response = HTTParty.get("https://owapi.net/api/v1/u/#{self.tag}/stats")
    if response["battletag"]
      store_data
    else

    end
  end

end

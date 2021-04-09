require_relative 'quality_controller'

class Normal_Updater

  def initialize(item)
    item.sell_in -= 1
    if item.sell_in >= 0
      item.quality -=1
    else
      item.quality -= 2
    end
    Quality_Controller.new(item)
  end

end

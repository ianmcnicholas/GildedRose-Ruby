require_relative 'quality_controller'

class Conjured_Updater

  def initialize(item)
    item.sell_in -= 1
    if item.sell_in >= 0
      item.quality -= 2
    else
      item.quality -= 4
    end
    Quality_Controller.new(item)
  end

end

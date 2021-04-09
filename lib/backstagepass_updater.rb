require_relative 'quality_controller'

class BackstagePass_Updater

  def initialize(item)
    item.sell_in -= 1
    if item.sell_in < 0
      item.quality = 0
    elsif item.sell_in <= 5
      item.quality += 3
    elsif item.sell_in <=10
      item.quality += 2
    else
      item.quality += 1
    end
    Quality_Controller.new(item)
  end

end

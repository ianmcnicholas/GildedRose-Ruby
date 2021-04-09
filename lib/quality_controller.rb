class Quality_Controller

  def initialize(item)
      item.quality = 50 if item.quality > 50
      item.quality = 0 if item.quality < 0
  end

end

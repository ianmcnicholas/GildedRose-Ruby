class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
      when "Sulfuras, Hand of Ragnaros"
        return item
      when "Aged Brie"
        item.sell_in -= 1
        item.quality += 2 if item.sell_in < 0 && item.quality <= 48
        item.quality += 1 if item.sell_in < 0 && item.quality < 50
        item.quality += 1 if item.sell_in >= 0 && item.quality < 50
      when "Backstage passes to a TAFKAL80ETC concert"
        item.sell_in -= 1
        item.quality += 1 if item.sell_in > 10 && item.quality < 50
        item.quality += 2 if item.sell_in <= 10 && item.sell_in > 5 && item.quality <= 48
        item.quality += 3 if item.sell_in <= 5 && item.sell_in >= 0 && item.quality <= 47
        item.quality = 0 if item.sell_in < 0
      else
        item.sell_in -= 1
        item.quality -= 1 if item.sell_in >= 0 && item.quality > 0
        item.quality -= 2 if item.sell_in < 0 && item.quality > 0
      end
    end
  end
end


class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

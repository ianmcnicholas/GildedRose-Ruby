class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      @item = item
      case item.name
      when "Sulfuras, Hand of Ragnaros"
        return item
      when "Aged Brie"
        aged_brie_update
      when "Backstage passes to a TAFKAL80ETC concert"
        backstage_pass_update
      else
        normal_update
      end
    end
  end
end

  private

  def aged_brie_update
    @item.sell_in -= 1
    @item.quality += 2 if @item.sell_in < 0 && @item.quality <= 48
    @item.quality += 1 if @item.sell_in < 0 && @item.quality < 50
    @item.quality += 1 if @item.sell_in >= 0 && @item.quality < 50
  end

  def backstage_pass_update
    @item.sell_in -= 1
    @item.quality += 1 if @item.sell_in > 10 && @item.quality < 50
    @item.quality += 2 if @item.sell_in <= 10 && @item.sell_in > 5 && @item.quality <= 48
    @item.quality += 3 if @item.sell_in <= 5 && @item.sell_in >= 0 && @item.quality <= 47
    @item.quality = 0 if @item.sell_in < 0
  end

  def normal_update
    @item.sell_in -= 1
    @item.quality -= 1 if @item.sell_in >= 0 && @item.quality > 0
    @item.quality -= 2 if @item.sell_in < 0 && @item.quality > 0
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

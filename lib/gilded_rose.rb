class GildedRose

  attr_accessor :items

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.map do |item|
      @item = item
      case
      when item.name == "Sulfuras, Hand of Ragnaros"
        item
      when item.name == "Aged Brie"
        aged_brie_update
        quality_control
      when item.name == "Backstage passes to a TAFKAL80ETC concert"
        backstage_pass_update
        quality_control
      # when item.name.include?("Conjured")
      #   p "This is a conjured item"
      #   normal_update
      else
        normal_update
        quality_control
      end
    end
  end
end

  private

  def aged_brie_update
    @item.sell_in -= 1
    if @item.sell_in < 0
      @item.quality += 2
    else
      @item.quality += 1
    end
  end

  def backstage_pass_update
    @item.sell_in -= 1
    if @item.sell_in < 0
      @item.quality = 0
    elsif @item.sell_in <= 5
      @item.quality += 3
    elsif @item.sell_in <=10
      @item.quality += 2
    else
      @item.quality += 1
    end
  end

  def normal_update
    @item.sell_in -= 1
    if @item.sell_in >= 0
      @item.quality -=1
    else
      @item.quality -= 2
    end
  end

  def quality_control
    @item.quality = 50 if @item.quality > 50
    @item.quality = 0 if @item.quality < 0
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

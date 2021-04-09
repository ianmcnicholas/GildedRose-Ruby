require_relative 'agedbrie_updater'
require_relative 'backstagepass_updater'
require_relative 'conjured_updater'
require_relative 'normal_updater'
require_relative 'item'

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
        AgedBrie_Updater.new(item)
      when item.name == "Backstage passes to a TAFKAL80ETC concert"
        BackstagePass_Updater.new(item)
      when item.name.include?("Conjured")
        Conjured_Updater.new(item)
      else
        Normal_Updater.new(item)
      end
    end
  end

end

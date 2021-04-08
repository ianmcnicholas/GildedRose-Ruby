require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
      expect(items[0].sell_in).to eq -1
      expect(items[0].quality).to eq 0
    end

    it "once the sell by date has passed, Quality decreases twice as fast" do
      items = [Item.new("Test Item", 0, 30)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Test Item"
      expect(items[0].sell_in).to eq -1
      expect(items[0].quality).to eq 28
    end

    it "the Quality of an item is never negative" do
      items = [Item.new("Test Item", 5, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Test Item"
      expect(items[0].sell_in).to eq 4
      expect(items[0].quality).to eq 0
    end

  context 'Aged Brie' do
    it "Aged Brie increases in Quality with age" do
      items = [Item.new("Aged Brie", 5, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Aged Brie"
      expect(items[0].sell_in).to eq 4
      expect(items[0].quality).to eq 11
    end

    it "Aged Brie increases 2 in Quality with age after sell by date" do
      items = [Item.new("Aged Brie", 0, 48)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Aged Brie"
      expect(items[0].sell_in).to eq -1
      expect(items[0].quality).to eq 50
    end

    it "the Quality of an item is never more than 50" do
      items = [Item.new("Aged Brie", 5, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Aged Brie"
      expect(items[0].sell_in).to eq 4
      expect(items[0].quality).to eq 50
    end
  end

  context 'Sulfuras' do
    it "Sulfuras never decreases in Quality or sell by date" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 5, 80)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Sulfuras, Hand of Ragnaros"
      expect(items[0].sell_in).to eq 5
      expect(items[0].quality).to eq 80
    end
  end

  context 'Backstage Passes' do
    it "Backstage passes increase in Quality like Aged Brie up to 10 days before event" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 15)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Backstage passes to a TAFKAL80ETC concert"
      expect(items[0].sell_in).to eq 14
      expect(items[0].quality).to eq 16
    end

    it "Backstage passes increase by 2 in Quality within 10 and 5 days of event" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 15)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Backstage passes to a TAFKAL80ETC concert"
      expect(items[0].sell_in).to eq 9
      expect(items[0].quality).to eq 17
    end

    it "Backstage passes increase by 3 in Quality within 5 days of event" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 15)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Backstage passes to a TAFKAL80ETC concert"
      expect(items[0].sell_in).to eq 4
      expect(items[0].quality).to eq 18
    end

    it "Backstage passes Quality drops to 0 after the concert" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 15)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Backstage passes to a TAFKAL80ETC concert"
      expect(items[0].sell_in).to eq -1
      expect(items[0].quality).to eq 0
    end
  end

  context 'Conjured items degrade twice as fast as normal items' do
    it 'degrade by 2 per day before sell by date' do
      items = [Item.new("Conjured Test Item", 5, 5)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Conjured Test Item"
      expect(items[0].sell_in).to eq 4
      expect(items[0].quality).to eq 3
    end

    it 'degrade by 4 per day after sell by date' do
      items = [Item.new("Conjured Test Item", 0, 5)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Conjured Test Item"
      expect(items[0].sell_in).to eq -1
      expect(items[0].quality).to eq 1
    end
  end

  context 'miscellaneous tests' do
    it "passes test 1" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Backstage passes to a TAFKAL80ETC concert"
      expect(items[0].sell_in).to eq 14
      expect(items[0].quality).to eq 21
    end
    it "passes test 2" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 49)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Backstage passes to a TAFKAL80ETC concert"
      expect(items[0].sell_in).to eq 9
      expect(items[0].quality).to eq 50
    end
    it "passes test 3" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 49)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "Backstage passes to a TAFKAL80ETC concert"
      expect(items[0].sell_in).to eq 4
      expect(items[0].quality).to eq 50
    end
  end


  end

end

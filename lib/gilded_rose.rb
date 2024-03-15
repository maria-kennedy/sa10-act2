class GildedRose

  def tick
    case @name
    when "Normal Item"
      normal_tick
    when "Aged Brie"
      brie_tick
    when "Sulfuras, Hand of Ragnaros"
      sulfuras_tick
    when "Backstage passes to a TAFKAL80ETC concert"
      backstage_tick
    end
  end


  def normal_tick
    @item = Normal.new(quality, days_remaining)
    item.tick
  end

  def brie_tick
    @item = Brie.new(quality, days_remaining)
  end
  
  def sulfuras_tick
    @item = Sulfuras.new(quality, days_remaining)
    item.tick
  end

  def backstage_tick
    @item = Backstage.new(quality, days_remaining)
    item.tick
  end
  # add a new class for Normal within GildedRose
  class Normal
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end

    def tick
      @days_remaining -= 1
      return if @quality == 0

      @quality -= 1
      @quality -= 1 if @days_remaining <= 0
    end

  end

  class Brie
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end

    def tick
      @days_remaining -= 1
      return if @quality >= 50

      @quality += 1
      @quality += 1 if @days_remaining <= 0 && @quality < 50 # per announcement
    end

  end

  class Sulfuras
    attr_reader :quality, :days_remaining
    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end

    def tick
      # do nothing
    end
  end

  class Backstage
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end

    def tick
      @days_remaining -= 1
      return      if @quality >= 50
      return @quality = 0 if @days_remaining < 0

      @quality += 1
      @quality += 1 if @days_remaining < 10
      @quality += 1 if @days_remaining < 5
    end

  end

end

class GildedRose
  def normal_tick
    @item = Normal.new(quality, days_remaining)
    item.tick
  end
  
  # add a new class for Normal within GildedRose
  class Normal
    attr_reader :quality, :days_remaining

    def initialize(quality:, days_remaining:)
      @quality = quality
      @days_remaining = days_remaining
    end

    def tick
      @days_remaining -= 1
      return if @quality == 0

      @quality -= 1
      @quality -= 1 if @days_remaining <= 0
    end

  end

  # refactored normal_tick
  def normal_tick
    @days_remaining -= 1
    return if @quality == 0

    @quality -= 1
    @quality -= 1 if @days_remaining <= 0
  end

  # refactored brie_tick
  def brie_tick
    @days_remaining -= 1
    return if @quality >= 50

    @quality += 1
    @quality += 1 if @days_remaining <= 0 && @quality < 50
  end

  def sulfuras_tick
    # do nothing
  end

  def backstage_tick
    @days_remaining -= 1
    return      if @quality >= 50
    return @quality = 0 if @days_remaining < 0

    @quality += 1
    @quality += 1 if @days_remaining < 10
    @quality += 1 if @days_remaining < 5
  end

end


class Image
  attr_reader :thumbnail, :original, :name

  def initialize(name, thumbnail, original)
    @name, @thumbnail, @original = name, thumbnail, original
  end

  def <=>(other)
    name <=> other.name
  end
end
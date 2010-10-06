
class Array
  def to_hash(values = [])
    Hash[*self.zip(values).flatten]
  end
end
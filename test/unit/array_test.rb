require "spec"
require '../../app/classes/image_fetcher'

describe Array do
  it 'should convert to hash' do
    [1, 2, 3].to_hash.should == { 1 => nil, 2 => nil, 3 => nil }
    [1, 2, 3].to_hash([4, 5, 6]).should == { 1 => 4, 2 => 5, 3 => 6 }
    puts "HA!"
  end
end
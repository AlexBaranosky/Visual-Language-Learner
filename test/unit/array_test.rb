require "spec"
require '../../app/classes/image_fetcher'

describe Array do
  it 'should convert to hash' do
    [1, 2, 3].to_hash.should == { 1 => nil, 2 => nil, 3 => nil }
  end
end
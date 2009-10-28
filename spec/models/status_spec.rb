require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Status do
  describe '- When cleaning text for processing' do
    it 'should remove any # characters' do
      Factory.build(:status, :text => 'this is a #test').clean_text.should == 'this is a test'
    end

    it 'should remove any @ characters' do
      Factory.build(:status, :text => 'this is from @test').clean_text.should == 'this is from test'
    end

    it 'should remove any hyperlinks' do
      Factory.build(:status, :text => 'a url is http://somewhere.com/testing').
        clean_text.should == 'a url is'
    end

    it 'should remove any punctuation' do
      Factory.build(:status, :text => "look! there is punctuation; it's great...").
        clean_text.should == "look there is punctuation it's great"
    end
  end
end

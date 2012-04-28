require 'pbcopy'

describe 'pbcopy' do

  # stolen from pasteboard's tests
  def assert_put *expecteds
    pb = Pasteboard.new
    expecteds.length.should == pb.get_item_count

    expecteds.each do |expected|
      expected.each_with_index do |(flavor, data), index|
        flavor.should == pb.copy_item_flavors(0)[index]
        data.should == pb.first(flavor)
      end
    end
  end

  it 'is available everywhere, but not visible in method lists' do
    expect { Object.new.pbcopy                   }.to raise_error NoMethodError
    expect { Object.new.instance_eval { pbcopy } }.to_not raise_error
  end


  describe 'piping a string into pbcopy' do
    specify 'they end up in system clipboard' do
      "hello world" | pbcopy
      assert_put [[Pasteboard::Type::UTF_8, "hello world"]]
    end

    specify 'the string is returned' do
      ("hello world" | pbcopy).should == "hello world"
    end
  end


  describe 'redirecting an object into pbcopy' do
    specify 'is the same as `obj.to_s | pbcopy`' do
      (pbcopy < "hello world").should == "hello world"
      assert_put [[Pasteboard::Type::UTF_8, "hello world"]]

      (pbcopy < 123).should == "123"
      assert_put [[Pasteboard::Type::UTF_8, "123"]]
    end
  end


  describe 'treating it like a method' do
    specify 'pass any object to pbcopy as an alternative to pbcopy < obj' do
      (pbcopy "hello world").should == "hello world"
      assert_put [[Pasteboard::Type::UTF_8, "hello world"]]

      (pbcopy 123).should == "123"
      assert_put [[Pasteboard::Type::UTF_8, "123"]]

      (pbcopy false).should == "false"
      assert_put [[Pasteboard::Type::UTF_8, "false"]]

      (pbcopy nil).should == ""
      assert_put [[Pasteboard::Type::UTF_8, ""]]
    end
  end
end

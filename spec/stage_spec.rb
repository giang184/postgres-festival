require 'rspec'
require('spec_helper')


describe '#Stage' do

  describe('.all') do
    it("returns an empty array when there are no stages") do
      expect(Stage.all ).to(eq([]))
    end
  end

  describe('#save') do
  it("should save a stage into the festival") do
    stage1 = Stage.new({:name => "Ga-Zoinks", :id => nil})
    stage1.save()
    expect(Stage.all).to(eq([stage1]))
    end
  end

  describe('#==') do
  it("is the same stage if it has the same attributes as another stage") do
    stage1 = Stage.new({:name => "Ga-Zoinks", :id => nil})
    stage2 = Stage.new({:name => "Ga-Zoinks", :id => nil})
    expect(stage2).to(eq(stage1))
    end
  end

  describe('.clear') do
    it("clears all stage") do
    stage1 = Stage.new({:name => "Ga-Zoinks", :id => nil})
    stage1.save()
    Stage.clear()
    expect(Stage.all).to(eq([]))
    end
  end
  
  describe('.find') do
    it("finds an stage by id") do
      stage1 = Stage.new({:name => "Ga-Zoinks", :id => nil})
      stage1.save()
      stage2 = Stage.new({:name => "Clam Chowder", :id => nil})
      stage2.save()
      expect(Stage.find(stage1.id)).to(eq(stage1))
    end
  end

  describe('#update') do
    it("updates an album by id") do
      stage1 = Stage.new({:name => "Ga-Zoinks", :id => nil})
      stage1.save()
      stage1.update("Love Jam")
      expect(stage1.name).to(eq("Love Jam"))
    end
  end
  
  describe('#delete') do
    it("deletes an album by id") do
      stage1 = Stage.new({:name => "Ga-Zoinks", :id => nil})
      stage1.save()
      stage2 = Stage.new({:name => "Clam Chowder", :id => nil})
      stage2.save()
      stage1.delete()
      expect(Stage.all).to(eq([stage2]))
    end
  end
end
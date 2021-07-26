require 'rspec'
require 'artist'
require 'stage'
require 'pry'

describe '#Artist' do

  before(:each) do
    @stage = Stage.new({:name => "Willy-wam", :id => nil})
    @stage.save()
  end

  describe('#==') do
    it("is the same artist if it has the same attributes as another artist") do
      artist1 = Artist.new({:name => "Bam-bam-ba-lam", :stage_id => @stage.id, :id => nil})
      artist2 = Artist.new({:name => "Bam-bam-ba-lam", :stage_id => @stage.id, :id => nil})
      expect(artist1).to(eq(artist2))
    end
  end

  describe('.all') do
    it("returns a list of all artists") do
      artist1 = Artist.new({:name => "Bam-bam-ba-lam", :stage_id => @stage.id, :id => nil})
      artist1.save()
      artist2 = Artist.new({:name => "Bam-bam", :stage_id => @stage.id, :id => nil})
      artist2.save()
      expect(Artist.all).to(eq([artist1, artist2]))
    end
  end

  describe('.clear') do
    it("clears all artists") do
      artist1 = Artist.new({:name => "Bam-bam-ba-lam", :stage_id => @stage.id, :id => nil})
      artist1.save()
      artist2 = Artist.new({:name => "Bam-bam", :stage_id => @stage.id, :id => nil})
      artist2.save()
      Artist.clear()
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#save') do
  it("saves an artist") do
    artist1 = Artist.new({:name => "Dude, wheres my dog", :stage_id => @stage.id, :id => nil})
    artist1.save()
    expect(Artist.all).to(eq([artist1]))
    end
  end

  describe('.find') do
    it("finds a artist by id") do
      artist1 = Artist.new({:name => "Bam-bam-ba-lam", :stage_id => @stage.id, :id => nil})
      artist1.save()
      artist2 = Artist.new({:name => "Bam-bam", :stage_id => @stage.id, :id => nil})
      artist2.save()
      expect(Artist.find(artist2.id)).to(eq(artist2))
    end
  end

  describe('#update') do
    it("updates an artist by id") do
      artist1 = Artist.new({:name => "Domo alli-gator", :stage_id => @stage.id, :id => nil})
      artist1.save()
      artist1.update("Mr. P.C.", @stage.id)
      expect(artist1.name).to(eq("Mr. P.C."))
    end
  end

  describe('#delete') do
    it("deletes an artist by id") do
      artist1 = Artist.new({:name => "Bam-bam", :stage_id => @stage.id, :id => nil})
      artist1.save()
      artist2 = Artist.new({:name => "LKam-bam", :stage_id => @stage.id, :id => nil})
      artist2.save()
      artist1.delete()
      expect(Artist.all).to(eq([artist2]))
    end
  end

  describe('.find_by_stage') do
    it("finds artist who are playing in the stage") do
      stage2 = Stage.new({:name => "Ga-Zoinks", :id => nil})
      stage2.save()
      artist1 = Artist.new({:name => "Bam-bam", :stage_id => @stage.id, :id => nil})
      artist1.save()
      artist2 = Artist.new({:name => "LKam-bam", :stage_id => stage2.id, :id => nil})
      artist2.save()
      expect(Artist.find_by_stage(stage2.id)).to(eq([artist2]))
    end
  end

  describe('#stage') do
    it("finds the stage an artist belongs to") do
      artist1 = Artist.new({:name => "Bam-bam-ba-lam", :stage_id => @stage.id, :id => nil})
      artist1.save()
      expect(artist1.stage()).to(eq(@stage))
    end
  end
end
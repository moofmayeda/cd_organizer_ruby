require 'rspec'
require 'cd_organizer'

describe CD do
  before do
    CD.clear
  end
  describe "initialize" do
    it "is initialized with a hash of attributes" do
      cd_new = CD.new({:artist=> "XYZ", :album => "123"})
      expect(cd_new).to be_an_instance_of CD
    end
  end

  describe ".all" do
    it "displays all CDs" do
      cd_1 = CD.new({:artist=> "XYZ", :album => "123"})
      cd_2 = CD.new({:artist=> "ABC", :album => "987"})
      expect(CD.all).to eq [cd_1, cd_2]
    end
  end

  describe ".sort_by_artist" do
    it "sorts artists by alphabetical order" do
      cd_1 = CD.new({:artist=> "XYZ", :album => "123"})
      cd_2 = CD.new({:artist=> "ABC", :album => "987"})
      expect(CD.sort_by_artist).to eq [cd_2, cd_1]
    end
  end

  describe ".sort_by_album" do
    it "sorts cds by album name alphabetically" do
      cd_1 = CD.new({:artist=> "XYZ", :album => "zeke"})
      cd_2 = CD.new({:artist=> "ABC", :album => "ira"})
      expect(CD.sort_by_album).to eq [cd_2, cd_1]
    end
  end

  describe ".search_by_artist" do
    it "finds albums of an artist" do
      cd_1 = CD.new({:artist=> "XYZ", :album => "zeke"})
      cd_2 = CD.new({:artist=> "ABC", :album => "ira"})
      cd_3 = CD.new({:artist=> "ABC", :album => "bob"})
      expect(CD.search_by_artist("ABC")).to eq [cd_2,cd_3]
    end
  end

  describe ".search_by_album" do
    it "finds the album" do
      cd_1 = CD.new({:artist=> "XYZ", :album => "zeke"})
      cd_2 = CD.new({:artist=> "ABC", :album => "ira"})
      cd_3 = CD.new({:artist=> "ABC", :album => "bob"})
      expect(CD.search_by_album("ira")).to eq [cd_2]
    end
  end

  describe ".list_all_artists" do
    it "lists all the artists alphabetically" do
      cd_1 = CD.new({:artist=> "XYZ", :album => "zeke"})
      cd_2 = CD.new({:artist=> "ABC", :album => "ira"})
      cd_3 = CD.new({:artist=> "ABC", :album => "bob"})
      expect(CD.list_all_artists).to eq ["ABC", "XYZ"]
    end
  end
end

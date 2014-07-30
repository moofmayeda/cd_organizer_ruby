class CD

  @@list_of_cds = []

  attr_reader(:artist, :album)

  def initialize(attributes)
    @artist = attributes[:artist]
    @album = attributes[:album]
    @@list_of_cds << self
  end

  def CD.clear
    @@list_of_cds = []
  end

  def CD.all
    @@list_of_cds
  end

  def CD.sort_by_artist
    @@list_of_cds.sort_by {|cd| cd.artist}
  end

  def CD.sort_by_album
    @@list_of_cds.sort_by {|cd| cd.album}
  end

  def CD.search_by_artist(artist)
    @@list_of_cds.select {|cd| cd.artist == artist}
  end

  def CD.search_by_album(album)
    @@list_of_cds.select {|cd| cd.album == album}
  end

  def CD.list_all_artists
    @@list_of_cds.map {|cd| cd.artist}.uniq.sort
  end
end

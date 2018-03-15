class Disk < Product
  attr_accessor :title, :artist, :genre, :year

  def self.from_file(file_path)
    line = File.readlines(file_path, encoding: 'UTF-8').map {|l| l.chomp}

    new(
        title: line[0],
        artist: line[1],
        genre: line[2],
        year: line[3],
        price: line[4],
        rest: line[5]
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @artist = params[:artist]
    @genre = params[:genre]
    @year = params[:year]
  end

  def to_s
    "Диск '#{title}', #{genre}, автор: #{artist}, год выхода #{year}, #{super}"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @author = params[:artist] if params[:artist]
    @genre = params[:genre] if params[:genre]
    @year = params[:year] if params[:year]
  end
end

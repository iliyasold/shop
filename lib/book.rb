class Book < Product
  attr_accessor :title, :genre, :author

  def self.from_file(file_path)
    line = File.readlines(file_path, encoding: 'UTF-8').map {|l| l.chomp}

    new(
        title: line[0],
        genre: line[1],
        author: line[2],
        price: line[3],
        rest: line[4]
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @genre = params[:genre]
    @author = params[:author]
  end

  def to_s
    "Книга '#{title}', #{genre}, автор: #{author}, #{super}"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @genre = params[:genre] if params[:genre]
    @author = params[:author] if params[:author]
  end
end

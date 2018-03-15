class Movie < Product
  attr_accessor :title, :year, :director

  def self.from_file(file_path)
    line = File.readlines(file_path, encoding: 'UTF-8').map {|l| l.chomp}

    new(
        title: line[0],
        year: line[1],
        director: line[2],
        price: line[3],
        rest: line[4]
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @year = params[:year]
    @director = params[:director]
  end

  def to_s
    "Фильм '#{title}', #{year} год, реж. #{director}, #{super}"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @year = params[:year] if params[:year]
    @director = params[:director] if params[:director]
  end
end

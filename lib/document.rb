class Document

  attr_accessor :title, :tags, :description

  def initialize(title, tags, description)
    @title = title
    @tags = tags
    @description = description
  end

  def self.all
    DB[:documents].all.map do |row|
      new(
        row[:title],
        row[:tags],
        row[:description]
      )
    end
  end

  #
  def save
    DB[:documents].insert(
      title: @title,
      tags: @tags,
      description: @description
    )
  end

end
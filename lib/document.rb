class Document

  attr_accessor :id, :title, :tags, :description

  def initialize(title, tags, description)
    @title = title
    @tags = tags
    @description = description
  end

  def self.all
    DB[:documents].all.map do |row|
      # FIXME: Deuda de codigo
      document = new(
        row[:title],
        row[:tags],
        row[:description]
      )
      document.id = row[:id]
      document
    end
  end

  def self.find(id)
    row = DB[:documents].where(id: id).first
    document = new(
      row[:title],
      row[:tags],
      row[:description]
    )
    document.id = row[:id]
    document
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
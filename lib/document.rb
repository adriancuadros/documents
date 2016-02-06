class Document

  attr_accessor :id, :title, :tags, :description

  def initialize(params={})
    @title = params[:title]
    @tags = params[:tags]
    @description = params[:description]
    @id = params[:id]
  end

  def self.all
    DB[:documents].all.map do |row|
      new(row)
    end
  end

  def self.find(id)
    new(DB[:documents].where(id: id).first)
  end

  def save
    DB[:documents].insert(
      title: @title,
      tags: @tags,
      description: @description
    )
  end

end
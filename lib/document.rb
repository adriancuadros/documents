class Document

  attr_accessor :title, :tags, :description

  def initialize(title, tags, description)
    @title = title
    @tags = tags
    @description = description
  end

  def save
    
  end

end
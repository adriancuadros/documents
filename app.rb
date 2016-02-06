require 'sinatra'
require './lib/document'

get '/' do
  erb :new_document
end

get '/documents' do
  @documents = []
  4.times do
    @documents << Document.new(
      'Titulo',
      'Tag1, Tag2',
      'Descripción'
    )
  end
  erb :documents
end

post '/create_document' do 
  @document = Document.new(
    params[:title],
    params[:tags],
    params[:description]
  )
  erb :document
end
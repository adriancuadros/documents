require 'sinatra'
require './lib/document'
require './config.rb'

get '/' do
  erb :new_document
end

get '/documents' do
  @documents = Document.all
  erb :documents
end

post '/create_document' do 
  @document = Document.new(
    params[:title],
    params[:tags],
    params[:description]
  )
  @document.save
  erb :document
end
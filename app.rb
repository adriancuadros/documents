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

get '/document/:id' do
  @document = Document.find(params[:id])
  erb :document
end

post '/create_document' do 
  @document = Document.new(params)
  @document.save
  erb :document
end
require 'sinatra'
require './lib/document'

get '/' do
  erb :new_document
end

post '/create_document' do 
  @document = Document.new(
    params[:title],
    params[:tags],
    params[:description]
  )
  erb :document
end
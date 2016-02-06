require 'sinatra'
require './lib/document'
require 'sequel'

DB = Sequel.sqlite('documents.db')

DB.create_table? :documents do
  primary_key :id
  String :title
  String :tags
  String :description
end

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
require 'sinatra'
require 'json'
require 'todo_service'

get '/todo' do
  TodoService.all.to_json
end

get '/todo/:id' do
  TodoService.find(params[:id])
end

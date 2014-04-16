require 'sinatra'
require 'json'
require 'yaml'

class Todo
  attr_reader :id, :text
  def initialize args={}
    @id = args['id']
    @done = args['done']
    @text = args['text']
  end

  def done?
    @done
  end

  def to_json args={}
    { id: @id, done: @done, text: @text }.to_json args
  end
end

class TodoService
  def self.all
    YAML.load_file('data.yml')['todos'].map { |data| Todo.new(data) }
  end

  def self.find id
    all.find { |todo| todo.id == id }
  end
end

get '/todo' do
  TodoService.all.to_json
end

get '/todo/:id' do
  TodoService.find(params[:id].to_i).to_json
end

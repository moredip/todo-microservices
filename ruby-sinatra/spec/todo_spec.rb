require 'spec_helper'
require 'todo'

describe 'todo' do
  let(:todos) { [] }
  let(:todo) { Todo.new }

  it 'returns todos' do
    TodoService.stub(:all) { todos }
    get '/todo'
    expect(last_response.body).to eq todos.to_json
  end

  it 'returns a specific todo' do
    TodoService.stub(:find) { todo }
    get '/todo/1'
    expect(last_response.body).to eq todo.to_json
  end

  describe 'todo service' do
    it 'returns all todos from file' do
      expect(TodoService.all.size).to eq 5
    end
    it 'maps todo data to a single todo' do
      expect(TodoService.all.first.id).to eq 1
    end
    it 'finds a single todo' do
      expect(TodoService.find(2).id).to eq 2
    end
  end

  describe 'todo' do
    subject { Todo.new('id' => 1, 'done' => true, 'text' => 'wash the dog') }
    it { should be_done }
    its(:id) { should == 1 }
    its(:text) { should == 'wash the dog' }
    its(:to_json) { should == '{"id":1,"done":true,"text":"wash the dog"}' }
  end
end

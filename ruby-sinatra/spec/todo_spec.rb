require 'spec_helper'
require 'todo'

describe 'todo' do
  def app
    Sinatra::Application
  end
  let(:todos) { [] }

  it 'returns todos' do
    TodoService.stub(:all) { todos }
    get '/todo'
    expect(last_response.body).to eq todos.to_json
  end
end

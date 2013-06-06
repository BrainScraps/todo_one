require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sinatra/resources'

ActiveRecord::Base.establish_connection(
   :adapter => 'postgresql',
   :host => 'localhost',
   :username => '',
   :password => '',
   :database => 'todo_one',
     :encoding => 'utf8'
)

require_relative "todo"

get '/todos/new' do
  erb :todo_new
end

post '/todos_destroy/:id' do
  # destroy post params[:id]
  Todo.find_by_id(params[:id]).destroy
  redirect "/todos"
end

post '/todos_archive/:id' do
  # update post params[:id]
  Todo.update(params[:id], :done_time => Time.now) 
  redirect "/todos"
end

resource :todos do
  get do
    # show all posts
    @todos = Todo.order(:due_date).reverse
    erb :todos
  end

  post do
    # create new post
    @todo = Todo.new(:todo_text => params["todo_text"], :due_date => params["due_date"])
    if @todo.save
      redirect "/todos"
    else
      redirect "/todo/new"
    end
  end


end

    get '/todos/:id' do
      # show post params[:id]
      @todo = Todo.find_by_id(params[:id])
      erb :edit
    end

    post '/todos/:id' do
      # show post params[:id]
      Todo.update( params[:id], :todo_text => params["todo_text"], :due_date => params["due_date"])
      redirect "/todos"
    end


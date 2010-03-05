require 'rho/rhocontroller'

class TodoController < Rho::RhoController

  #GET /Todo
  def index
    @todos = Todo.find(:all)
    render
  end

  # GET /Todo/{1}
  def show
    @todo = Todo.find(@params['id'])
    if @todo
      render :action => :show
    else
      redirect :action => :index
    end
  end

  # GET /Todo/new
  def new
    @todo = Todo.new
    render :action => :new
  end

  # GET /Todo/{1}/edit
  def edit
    @todo = Todo.find(@params['id'])
    if @todo
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /Todo/create
  def create
    @todo = Todo.new(@params['todo'])
    @todo.save
    redirect :action => :index
  end

  # POST /Todo/{1}/update
  def update
    @todo = Todo.find(@params['id'])
    @todo.update_attributes(@params['todo']) if @todo
    redirect :action => :index
  end

  # POST /Todo/{1}/delete
  def delete
    @todo = Todo.find(@params['id'])
    @todo.destroy if @todo
    redirect :action => :index
  end
end

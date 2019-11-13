class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @people = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end
  
  def update
    @person = Person.find(params[:id])
    if @person.update(person_params)
      redirect_to people_path
    else
      render :edit
    end
  end
  def create
    @person = Person.new(people_params)
    if @person.save
      redirect_to people_path
      else
        render :new
      end
    end
  end

  def destroy
    Person.find(params[:id]).destroy
    redirect_to people_path
  end 
  
  def person_params
    params.require(:person).permit(:first_name, :last_name)
  end








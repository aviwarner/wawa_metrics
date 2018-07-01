class ApplicationsController < ApplicationController
  def index
    @applications = Application.where(user_id: current_user.id)
  end

  def show
    @application = Application.find(params[:id])
    @event_collection = Event.where(application_id: @application.id)
    @events = Event.where(application_id: @application.id).group_by(&:name)
  end

  def new
    @application = Application.new
  end

  def edit
    @application = Application.find(params[:id])
  end

  def create
    @application = Application.new(application_params)
    @application.user_id = current_user.id

    if @application.save
      redirect_to @application, notice: "Application was added successfully"
    else
      flash.now[:alert] = "Error creating application, try again."
      render :new
    end
  end

  def destroy
    @application = Application.find(params[:id])

    if @application.destroy
      flash[:notice] = "\"#{@application.name}\" was deleted successfully."
      redirect_to applications_path
    else
      flash.now[:alert] = "There was an error deleting the application."
      render :show
    end
  end

def update
  @application = Application.find(params[:id])
  @application.assign_attributes(application_params)

  if @application.save
    flash[:notice] = "Application was updated."
    redirect_to @application
  else
    flash.now[:alert] = "There was an error saving the application. Please try again."
    render :edit
  end
end

  private
  def application_params
    params.require(:application).permit(:name, :url)
  end
end

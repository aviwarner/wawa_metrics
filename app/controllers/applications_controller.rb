class ApplicationsController < ApplicationController
  def index
    @applications = Application.where(user_id: current_user.id)
  end

  def show
    @application = Application.find(params[:id])
  end

  def new
    @application = Application.new
  end

  def edit
    @application = Application.find(params[:id])
  end

  def create
    @application = Application.new
    @application.name = params[:application][:name]
    @application.url = params[:application][:url]
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
  @application.name = params[:application][:name]
  @application.url = params[:application][:url]

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

class ProfilesController < ApplicationController
before_action :set_profile, only: [:show, :edit, :update]

  def new
    @profile = Profile.new
    authorize @profile
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    authorize @profile

    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def show


  end

  def edit

  end

  def update
    if @profile.update(profile_params)#params viene ya que para editar tienes que editar los params
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end

 def set_profile
    @profile = Profile.find(params[:id])
    authorize @profile
   end


  private

  def profile_params
    params.require(:profile).permit(:name, :bio, :photo)
  end

end

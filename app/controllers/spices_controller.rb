class SpicesController < ApplicationController
      
# GET /spices
  def index
    spice = Spice.all
    render json: spice
  end

  # POST /spices
  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  # PATCH /spices/:id
  def update
    spice = Spice.find_by(id: params[:id])
    if spice
        spice.update(spice_params)
      render json: spice
    else
      render json: { error: "Spice not found" }, status: :not_found
    end
  end

  #DESTROY /spices
  def destroy
    spice = Spice.find_by(id: params[:id])
    if spice
        spice.destroy
      head :no_content
    else
      render json: { error: "Spice not found" }, status: :not_found
    end
  end

  private

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end


end

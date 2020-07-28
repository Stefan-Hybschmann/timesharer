class OwnershipsController < ApplicationController
  def index
    @home = Home.find(params[:home_id])
    @ownerships = policy_scope(Ownership)
    @ownerships = @home.ownerships
  end

  def edit
    @ownership = Ownership.find(params[:id])
    authorize @ownership
  end

  def update
    @ownership = Ownership.find(params[:id])
    authorize @ownership
    if @ownership.update(ownership_params)
      redirect_to home_ownerships_path(@ownership.home), notice: 'Owner was successfully updated!'
    else
      render :edit
    end
  end

  private

  def ownership_params
    params.require(:ownership).permit(:shares_of_ownership)
  end
end

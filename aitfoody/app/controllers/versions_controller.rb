class VersionsController < ApplicationController
  before_action :require_user
  # before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_revarticle_and_version, only: [:diff, :rollback, :destroy]

  def diff
  end

  def rollback
    # change the current document to the specified version
    # reify gives you the object of this version
    revarticle = @version.reify
    revarticle.save
    redirect_to edit_revarticle_path(revarticle)
  end

  private

  def set_revarticle_and_version
    @revarticle = Revarticle.find(params[:revarticle_id])
    @version = @revarticle.versions.find(params[:id])
  end

end
class ResultsController < ApplicationController

  def create
    respond_to do |format|
      if @result.save
        format.html {redirect_to redirect_path, notice: "Note was successfully created."}
        format.js
      else
        format.html {render action: "new"}
        format.json {render json: @result.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @result.update(resource_params)
        format.html {
          redirect_to redirect_path, notice: "Note was successfully updated."
        }
        format.json {render json: @result}
      else
        format.html {render action: "edit"}
        format.json {render json: @result.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @result.destroy
    respond_to do |format|
      format.html {redirect_to redirect_path}
      format.json {head :no_content}
    end
  end

  protected

  def resource_params
    permitted_attributes = [
      :id, :resource_id, :resource_type, :_destroy, :title, :located, :start_date, :description, :place
    ]
    params.require(:result).permit(permitted_attributes)
  end

  def redirect_path
    params[:return_url] || root_url
  end
end

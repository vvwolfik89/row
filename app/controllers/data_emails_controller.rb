class DataEmailsController < ApplicationController
  def new
    @data_email = DataEmail.new
    respond_to do |format|
      format.js {render "/data_emails/new.js.erb", type_of: params[:type_of]}
    end
  end

  def create
    @data_email = DataEmail.new(resource_params)
    respond_to do |format|
      if @data_email.save

        UserMailer.with(data_email: @data_email).welcome_email.deliver
        # format.html { redirect_to @data_email, notice: 'Help desk link was successfully created.' }
        format.json {render json: @data_email, status: :created, location: @data_email}
        format.js {render 'data_emails/success'}
      else
        # format.html { render action: :new }
        format.json {render json: @data_email.errors, status: :unprocessable_entity}
        format.js {render 'new'}
      end
    end
  end

  protected

  def resource_params
    permitted_fields = [
      :email, :text, :address, :name, :unp, :type_of_email
    ]
    params.require(:data_email).permit(permitted_fields)
  end
end

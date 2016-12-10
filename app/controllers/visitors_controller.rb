class VisitorsController < ApplicationController

  def new
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(secure_params)
    if @visitor.valid?
      UserMailer.contact_email(@visitor).deliver_now
      flash[:notice] = "Message sent from #{@visitor.name}."
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def secure_params
    params.require(:visitor).permit(:name, :email, :message, :phone)
  end

end

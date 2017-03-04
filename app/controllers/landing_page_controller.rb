class LandingPageController < ApplicationController
  def index
  end

  def store_contact
    @contact = Contact.new
    @contact.name = params[:name]
    @contact.surname = params[:surname]
    @contact.email = params[:email]
    @contact.address = params[:address]
    if (params[:name].present? && params[:surname].present?) || params[:email].present? || params[:address].present?
      if @contact.save
        session[:contact] = @contact
        flash.now[:alert] = "Your contact has been saved!"
        render "index"
      else
        render text: 'You did not enter a contact'
      end
    else
      flash[:alert] = "Please enter contact information!"
      redirect_to '/'
    end
  end

  def go_to_contacts
    @contacts = Contact.all
    render "contact"
  end

  def go_back
    render "index"
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.name = params[:name]
    @contact.surname = params[:surname]
    @contact.email = params[:email]
    @contact.address = params[:address]
    @contact.save
    redirect_to "/contact"
  end

  def delete
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to "/contact"
  end
end

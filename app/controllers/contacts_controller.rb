class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Thanks for your message!'
      redirect_to root_path
    else
      flash.now[:error] = 'Cannot send message.'
      render :new, status: :bad_request
    end
  end

end

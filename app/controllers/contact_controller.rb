class ContactController < ApplicationController
  def new
    @contact_message = ContactMessage.new
    @social_links = Profile.first&.social_links&.order(:position)
    set_page_meta(
      title: "Contact | THE_ARCHITECT",
      description: "Gui yeu cau hop tac hoac lien he truc tiep."
    )
    track_event("page_view", path: request.path)
  end

  def create
    @contact_message = ContactMessage.new(contact_message_params.merge(source_page: request.referer))
    if @contact_message.save
      track_event("contact_submit", source_page: @contact_message.source_page)
      redirect_to contact_path, notice: "Gui lien he thanh cong."
    else
      @social_links = Profile.first&.social_links&.order(:position)
      set_page_meta(
        title: "Contact | THE_ARCHITECT",
        description: "Gui yeu cau hop tac hoac lien he truc tiep."
      )
      render :new, status: :unprocessable_entity
    end
  end

  private

  def contact_message_params
    params.require(:contact_message).permit(:name, :email, :subject, :message)
  end
end

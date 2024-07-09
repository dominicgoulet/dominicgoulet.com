# frozen_string_literal: true

module Admin
  class SocialLinksController < AdminController
    before_action :set_social_link, only: %w[edit update destroy]

    def index
      @social_links = SocialLink.all.order(caption: :asc)
    end

    def new
      @social_link = SocialLink.new
    end

    def create
      @social_link = SocialLink.new(social_link_params)

      if @social_link.save
        redirect_to admin_social_links_path, notice: "Sucessfully created social link."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @social_link.update(social_link_params)
        redirect_to admin_social_links_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      if @social_link.destroy
        redirect_to admin_social_links_path, notice: "Sucessfully deleted social link."
      else
        redirect_to admin_social_links_path, alert: @social_link.errors.full_messages.join(", ")
      end
    end

    private

    def set_social_link
      @social_link = SocialLink.find(params[:id])
    end

    def social_link_params
      params.require(:social_link).permit(:caption, :href, :svg_path)
    end
  end
end

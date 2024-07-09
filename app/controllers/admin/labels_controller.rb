# frozen_string_literal: true

module Admin
  class LabelsController < AdminController
    before_action :set_label, only: %w[edit update destroy]

    def index
      @labels = Label.all.order(name: :asc)
    end

    def new
      @label = Label.new
    end

    def create
      @label = Label.new(label_params)

      if @label.save
        redirect_to admin_labels_path, notice: "Sucessfully created label."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @label.update(label_params)
        redirect_to admin_labels_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      if @label.destroy
        redirect_to admin_labels_path, notice: "Sucessfully deleted label."
      else
        redirect_to admin_labels_path, alert: @label.errors.full_messages.join(", ")
      end
    end

    private

    def set_label
      @label = Label.find(params[:id])
    end

    def label_params
      params.require(:label).permit(:name)
    end
  end
end

# frozen_string_literal: true

class Label < ApplicationRecord
  # Associations
  has_many :article_labels
  has_many :articles, through: :article_labels

  # Validations
  validates :name, presence: true

  # Callbacks
  before_destroy :check_for_articles, prepend: true

  private

  def check_for_articles
    return unless articles.any?

    errors.add(:base, "Cannot delete label while articles exist that reference it")
    throw :abort
  end
end

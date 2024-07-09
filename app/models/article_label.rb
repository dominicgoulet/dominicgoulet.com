# frozen_string_literal: true

class ArticleLabel < ApplicationRecord
  # Associations
  belongs_to :article
  belongs_to :label
end

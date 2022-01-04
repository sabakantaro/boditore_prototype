# frozen_string_literal: true

class TagRelationship < ApplicationRecord
  belongs_to :post
  belongs_to :tag
end

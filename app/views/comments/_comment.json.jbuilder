# frozen_string_literal: true

json.extract! comment, :id, :content, :created_at, :updated_at
json.url comment_url(comment, format: :json)

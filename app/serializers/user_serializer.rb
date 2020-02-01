# frozen_string_literal: true

# serializer for User
class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :is_admin
end

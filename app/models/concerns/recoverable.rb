module Recoverable
    extend ActiveSupport::Concern

    included do
        before_create :create_activation_digest
        attr_accessor :activation_token

        private

        def create_activation_digest
            self.activation_token  = User.new_token
            self.activation_digest = User.digest(activation_token)
        end
    end

end
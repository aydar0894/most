module Filterable extend ActiveSupport::Concern

    module ClassMethods
        # :nocov:
        def filter(filtering_params)
            results = self.where(nil)
            filtering_params.each do |key, value|
                results = results.public_send(key, value) if value.present?
            end
            results
        end
        # :nocov:
    end

end

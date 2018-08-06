module Geosearchable
   extend ActiveSupport::Concern

   module ClassMethods

      def geosearch
         unless (result = Geocoder.search(self.address)).blank?
            result.first
         else
            nil
         end
      end
   end
end

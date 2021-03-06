module Net
  module TTI
    class ProtocolNegotiationRequest < Message
      # BinData fields
      # In the request, this will be the version(s) the client supports; in the
      # response, this will be the version the server chooses. These are a
      # concatenated string of version numbers (e.g. 060504).
      stringz   :client_versions_string
      stringz   :protocol_handler

      def _ttc_code
        TTC_CODE_PROTOCOL_NEGOTIATION
      end
      private :_ttc_code

      def self.create_request(client_versions=[6], protocol_handler="Linuxi386/Linux-2.0.34-8.1.0")
        request = self.new
        request.client_versions = client_versions
        request.protocol_handler = protocol_handler

        return request
      end

      def client_versions=(versions)
        self.client_versions_string = versions.pack("C*")
      end
    end
  end
end

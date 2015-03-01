require "pathname"
require "execjs"

module SprocketsPostcssEssentials
  class Processor
    class << self
      def process(css, options = {})
        options[:from] ||= "."

        processor.call("process", css, options)
      end

      private

      def processor
        @processor ||= ExecJS.compile(processor_js)
      end

      def processor_js
        [bundle_js, process_proxy].join(";")
      end

      def bundle_js
        @bundle_js ||= Pathname(__FILE__).join("../../../vendor/bundle.js").read
      end

      def process_proxy
        "var essentials = require('postcss-essentials');
        function process(css, opts) { return essentials(css, opts).css; }"
      end
    end
  end
end

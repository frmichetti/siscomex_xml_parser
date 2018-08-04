module Controllers
  module MiniController
    class << self
      def included(controller)

        controller.namespace('/api') {|c|
          c.get('') {
            make_default_json_api(instance: self) {
              {msg: 'Welcome To Dynamic Ruby Class Creator Apis'}
            }
          }
        }


      end
    end
  end
end
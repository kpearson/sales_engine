module Fixture

    def self.data
      sales_engine_test_root = File.expand_path('../', __FILE__)
      fixture_data = File.join sales_engine_test_root, 'fixtures'
    end
end
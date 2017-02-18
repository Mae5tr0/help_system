require 'json-schema'

# Json schema matcher
# Schema files should be placed at spec/json_schemas
#
# @example validate json against bundles.json schema
#  expect(json).to match_json_schema('bundles/show')
#
RSpec::Matchers.define :match_json_schema do |against|
  match do |json|
    file_name = Rails.root.join('spec', 'json_schemas', "#{against}.json").to_s

    if File.exist?(file_name)
      JSON::Validator.validate!(file_name, json)
    else
      fail "Could not find schema file #{file_name}"
    end
  end
end

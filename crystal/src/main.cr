require "graphql"
require "kemal"

require "./pinpoint_xref"

@[GraphQL::Object]
class Query < GraphQL::BaseQuery
  @[GraphQL::Field(description: "Modify existing links when there's a pinpoint citation.")]
  def add_pinpoint_links(html : String) : String
    PinpointXref.add_pinpoint(html)
  end
end

#
# GraphQL Boilerplate
#

schema = GraphQL::Schema.new(Query.new)

post "/graphql" do |env|
  env.response.content_type = "application/json"

  query = env.params.json["query"].as(String)
  variables = env.params.json["variables"]?.as(Hash(String, JSON::Any)?)
  operation_name = env.params.json["operationName"]?.as(String?)

  schema.execute(query, variables, operation_name)
end

Kemal.run

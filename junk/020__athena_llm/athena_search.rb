require 'aws-sdk-bedrockruntime'

bedrock = Aws::BedrockRuntime::Client.new

def natural_language_to_sql(user_query)
  prompt = <<~PROMPT
    Convert this natural language query to SQL for searching image inventory:
    
    Table: image_inventory
    Columns: name, range, description, tags, colors, objects, mood, location, time_of_day
    
    User query: "#{user_query}"
    
    Return only the SQL query, no explanation:
  PROMPT

  request_body = {
    prompt: prompt,
    max_tokens: 200,
    temperature: 0.1
  }

  response = bedrock.invoke_model({
    model_id: "amazon.nova-lite-v1:0",
    body: request_body.to_json
  })

  result = JSON.parse(response.body.read)
  result['completion'].strip
end

# Example usage
user_queries = [
  "Show me sunset images",
  "Find pictures with palm trees and ocean",
  "Images with peaceful mood",
  "Beach photos taken during golden hour"
]

user_queries.each do |query|
  sql = natural_language_to_sql(query)
  puts "Query: #{query}"
  puts "SQL: #{sql}"
  puts "---"
end
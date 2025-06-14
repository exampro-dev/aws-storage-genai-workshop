require 'aws-sdk-s3'
require 'dotenv'

Dotenv.load

# Initialize S3 client
s3 = Aws::S3::Client.new(
  region: ENV['AWS_REGION'],
  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
)

# Get byte range (e.g., bytes 100-199)
response = s3.get_object(
  bucket: ENV['AWS_BUCKET_NAME'],
  key: ENV['AWS_FILE_KEY'],
  range: 'bytes=100-199'
)

# Access the partial content
partial_data = response.body.read
puts partial_data
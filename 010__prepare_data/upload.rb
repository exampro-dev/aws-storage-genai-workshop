require 'aws-sdk-s3'
require 'zip'
require 'dotenv'

Dotenv.load

# Delete existing zip file and inventory file
File.delete(ENV['AWS_FILE_KEY']) if File.exist?(ENV['AWS_FILE_KEY'])
File.delete("#{File.basename(ENV['AWS_FILE_KEY'], '.zip')}_inventory.json") if File.exist?("#{File.basename(ENV['AWS_FILE_KEY'], '.zip')}_inventory.json")

# Zip all images in images directory
Zip::File.open(ENV['AWS_FILE_KEY'], Zip::File::CREATE) do |zipfile|
  Dir.glob('images/*').each do |file|
    zipfile.add(File.basename(file), file)
  end
end

# Now read the created ZIP to get accurate byte positions
inventory = { files: [] }
# Analyze ZIP structure
Zip::File.open(ENV['AWS_FILE_KEY']) do |zip|
  zip.each do |entry|
    next if entry.directory?
    
    # Calculate actual byte positions in the ZIP file
    local_header_size = 30 + entry.name.length + entry.extra.length
    start_byte = entry.local_header_offset + local_header_size
    end_byte = start_byte + entry.compressed_size - 1
    
    inventory[:files] << {
      name: entry.name,
      type: File.extname(entry.name),
      compressed_size: entry.compressed_size,
      uncompressed_size: entry.size,
      start_byte: start_byte,
      end_byte: end_byte,
      range: "bytes=#{start_byte}-#{end_byte}",
      compression_method: entry.compression_method
    }
  end
end

# Save inventory file
inventory_path = "#{File.basename(ENV['AWS_FILE_KEY'], '.zip')}_inventory.json"
File.write(inventory_path, JSON.pretty_generate(inventory))

# Upload zip file to S3
s3 = Aws::S3::Client.new
s3.put_object(
  bucket: ENV['AWS_BUCKET_NAME'],
  key: ENV['AWS_FILE_KEY'],
  body: File.open(ENV['AWS_FILE_KEY']),
  content_type: 'application/zip'
)

# Upload inventory file to S3
s3.put_object(
  bucket: ENV['AWS_BUCKET_NAME'],
  key: inventory_path,
  body: File.open(inventory_path),
  content_type: 'application/x-ndjson'
)
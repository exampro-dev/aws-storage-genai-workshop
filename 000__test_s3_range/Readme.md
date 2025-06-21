## Copy and Set Dot Env File.

Create a copy of the .env.example in the root directory called `.env`

- Update AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY
- Set your own unique AWS_BUCKET_NAME

```sh
cd /workspaces/aws-storage-genai-workshop/000__test_s3_range/
```

## Create Bucket

```bash
./bin/create_bucket
```

## Upload File

```bash
./bin/upload_file
```

## Read Part of file

```bash
./bin/read_range
```
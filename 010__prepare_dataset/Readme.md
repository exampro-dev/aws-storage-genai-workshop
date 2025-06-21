
## Generate Mock Images

```sh
./bin/000__generate
```

## Annotate Images

```sh
./bin/010__annotate
```

> This will annotate our real images, not the mock ones. If we can to include the mock ones we need to copy them into the input directory

## Create Archive, Inventory File and Upload to S3

```sh
./bin/020__upload
```

## Test Downloading Single Image from the Archive

```sh
./bin/030__download
```

## Create Embedding Data

```sh
./bin/040__embedd
```
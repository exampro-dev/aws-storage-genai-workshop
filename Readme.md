## Business Use-Case

An engineering firm needs to audit and track public infrastructure for safety via drone arial footage. They have captured tens of thousands of images (eg. cracks in bridges) and have stored them within archives based on year and month.

As a Cloud Engineer you have been tasked to building a proof-of-concept where you can use GenAI to use natural language to retrieve an image from the archive.

You need to report back possible technical paths and technical considerations for this project.

## Technical Uncertainty

- Can we extract specific bytes from an S3 file and read them?
- Can we extract a specific image file from a zip archive from s3 (without the need to download archive)
- Can we generate annotation for images in structure json output using Amazon Nova?
- Will a vector database enable us to find matching images using natural langauge?
- Can we get Amazon Nova to generate our query to our vector database?
- Can we use Amazon Nova to generate mock images to vary our dataset?

## Public Dataset

## Technical Solution

![](./docs/diagram.png)


## 

We are using the CUBIT Infrastructure Defect Detection Dataset

https://github.com/BenyunZhao/CUBIT
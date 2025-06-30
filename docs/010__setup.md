# Setup

## AWS Account Setup

### Enable All Amazon Bedrock Models

Change your region your to `東京 ap-northeast-1`

![](./assets/change_region.png)

1. [Enable All Amazon Bedrock Models](https://ap-northeast-1.console.aws.amazon.com/bedrock/home?region=ap-northeast-1#/modelaccess) in `ap-northeast-1`

### Generate AWS Credentials to use in Github Codespaces Developer Environment

## Prepare GitHub CodeSpaces Environment
2. [Generate AWS  for GitHub CodeSpaces](https://us-east-1.console.aws.amazon.com/iam/home?region=ap-northeast-1#/users)


### Install AWS CLI

```sh
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" && \
cd /tmp && unzip awscliv2.zip && sudo ./aws/install && \
rm -rf awscliv2.zip aws/ && cd -
```

### Run Bunlder

```sh
bundle install
```
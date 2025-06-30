# Setup

## AWS Account Setup

### Enable All Amazon Bedrock Models

- Change your region your to `東京 ap-northeast-1`

<img src="./assets/change_region.png" width="600px"></img>

- In the search bar type `bedrock`
- Click on Amazon Bedrock to go to this service.

<img src="./assets/navigate_bedrock.png" width="600px"></img>

- In the left hand column click on `モデルアクセス`

<img src="./assets/find_model_access.png" width="600px"></img>

- Click on `すべてのモデルを有効にする`

<img src="./assets/start_model_access.png" width="600px"></img>

- Click on `次へ`

<img src="./assets/select_models.png" width="600px"></img>


- Click on `送信`

<img src="./assets/confirm_model.png" width="600px"></img>

- See that the models `Nova Pro`, `Nova Canvas` are enabled

<img src="./assets/see_models.png" width="600px"></img>


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
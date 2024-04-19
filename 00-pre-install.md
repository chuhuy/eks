# 00 - Highlights

- Install AWS cli
- Install kubectl cli
- Install eksctl cli

# 01 - install aws cli

Ref 1:
[https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html){:target='\_blank'}

Ref 2:
[https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html){:target='\_blank'}

MacOs:

```
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /

```

Verify

```

which aws
aws --version

```

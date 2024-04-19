# 00 - Highlights

- Install AWS cli
- Install kubectl cli
- Install eksctl cli

# 01 - install aws cli

Ref 1:
[https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

Ref 2:
[https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

MacOs:

```
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
```

### verify aws cli installed location

Command

```
which aws
```

Output:

```
/usr/local/bin/aws
```

### verify aws version

Command

```
aws --version
```

Output:

```
aws-cli/2.9.7 Python/3.9.11 Darwin/23.4.0 exe/x86_64 prompt/off
```

---

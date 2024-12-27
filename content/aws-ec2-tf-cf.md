---
title: Deploying EC2 with... everything.
draft: false
tags:
  - aws
  - cloud
  - VMs
  - EC2
  - CloudFront
  - Terraform
  - OpenTofu
  - IaC
  - CDK
---

# Let's get straight to business.

## What do we want to do?

Deploy an AWS EC2 instance in a fantastically diverse collection of ways. **Not** including clicking through things in a web UI *(that's cool but too slow and too easy, thus very boring)* nor **especially pulling an untrustworthy LLM-generated YAML or Bash script from Amazon Q itself** ~~(or loose sequence of 3 commands, to be more precise)~~.
##### Which download we sure did!
So, now, let's break that nightmare down.

> [!bug]- The LLM (Ludicrous Laziness Methodology) Zone
>
> > [!info] Note
> >
> > Obviously, sensitive information about actual things I'm deploying and my IP address have been redacted. Not that I'm worried, anyways - my ISP locked me behind CG-NAT with no IPv6, after all `*ugly sobbing*`.
>
> Before we begin, let's make one thing clear - I already have set up a VPC, a SSH keyset and a security group. Then I went to create a very specific kind of EC2 instance. AWS gave me two options for exporting my EC2 params: an "AI generated YAML", or a sequence of long `aws` commands (probably also with a neural network shoved in there somewhere for no practical reason whatsoever):
> 
> ```yaml
> Resources:
>  EC2SecurityGroup:
>    Type: AWS::EC2::SecurityGroup
>    Properties:
>      GroupName: launch-wizard-1
>      GroupDescription: launch-wizard-1 created 2020-08-28T00:57:57.123Z
>      VpcId: vpc-0e2cd7c927ac9484e
>      SecurityGroupIngress:
>        - IpProtocol: tcp
>          FromPort: 22
>          ToPort: 22
>          CidrIp: 80.0.81.35/32
>
>  EC2Instance:
>    Type: AWS::EC2::Instance
>    Properties:
>      ImageId: ami-07a4c6232c4e5a0ec
>      InstanceType: t4g.nano
>      BlockDeviceMappings:
>        - DeviceName: /dev/xvda
>          Ebs:
>            Encrypted: false
>            DeleteOnTermination: true
>            Iops: 3000
>            SnapshotId: snap-0f815581f5eda1e29
>            VolumeSize: 8
>            VolumeType: gp3
>            Throughput: 125
>      NetworkInterfaces:
>        - AssociatePublicIpAddress: true
>          DeviceIndex: 0
>          GroupSet: 
>            - !Ref EC2SecurityGroup
>      CreditSpecification:
>        CPUCredits: unlimited
>      Tags:
>        - Key: Name
>          Value: My Badass Server
>        - Key: Codename  
>          Value: my-badass-serevr
>        - Key: Type
>          Value: BastionServer
>      MetadataOptions:
>        HttpEndpoint: enabled
>        HttpPutResponseHopLimit: 2
>        HttpTokens: required
>      PrivateDnsNameOptions:
>        HostnameType: ip-name
>        EnableResourceNameDnsARecord: true
>        EnableResourceNameDnsAAAARecord: false
> ```
>
> And the corresponding Bash hellcommand sequence:
> 
> ```sh
> #!/usr/bin/bash
> aws ec2 create-security-group --group-name "launch-wizard-1" --description "launch-wizard-1 created 2020-08-28T00:57:57.123Z" --vpc-id "vpc-0e2cd7c927ac9484e" 
> 
> aws ec2 authorize-security-group-ingress --group-id "sg-preview-1" --ip-permissions '{"IpProtocol":"tcp","FromPort":22,"ToPort":22,"IpRanges":[{"CidrIp":"80.0.81.35/32"}]}' 
> 
> aws ec2 run-instances --image-id "ami-07a4c6232c4e5a0ec" --instance-type "t4g.nano" --block-device-mappings '{"DeviceName":"/dev/xvda","Ebs":{"Encrypted":false,"DeleteOnTermination":true,"Iops":3000,"SnapshotId":"snap-0f815581f5eda1e29","VolumeSize":8,"VolumeType":"gp3","Throughput":125}}' --network-interfaces '{"AssociatePublicIpAddress":true,"DeviceIndex":0,"Groups":["sg-preview-1"]}' --credit-specification '{"CpuCredits":"unlimited"}' --tag-specifications '{"ResourceType":"instance","Tags":[{"Key":"Name","Value":"My Badass Server"},{"Key":"Codename","Value":"my-badass-server"},{"Key":"Type","Value":"BastionServer"}]}' --metadata-options '{"HttpEndpoint":"enabled","HttpPutResponseHopLimit":2,"HttpTokens":"required"}' --private-dns-name-options '{"HostnameType":"ip-name","EnableResourceNameDnsARecord":true,"EnableResourceNameDnsAAAARecord":false}' --count "1" 
> ``` 
> 
> Hellish indeed. Surely I can do it better just by reading a bit of documentation, right?

### What?

I like the feeling of knowing what I'm doing, so let's dive into some prerequisites.

## What can we do?

## Terraform

## OpenTofu

## CloudFront

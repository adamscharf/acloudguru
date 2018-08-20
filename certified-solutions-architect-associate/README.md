# Certified Solutions Architect - Associate

## TOC

* [10,000 ft Overview](#10000-ft-overview)
    * [AWS Global Infrastructure](#aws-global-infrastructure)
    * [Compute](#compute)
    * [Storage](#storage)
    * [Databases](#databases)
    * [Migration](#migration)
    * [Networking & Content Delivery](#networking-content-delivery)
    * [Developer Tools](#developer-tools)
    * [Management Tools](#management-tools)
    * [Media Services](#media-services)
    * [Machine Learning](#machine-learning)
    * [Analytics](#analytics)
    * [Security & Identity & Compliance](#security-identity-compliance)
    * [Mobile Services](#mobile-services)
    * [AR / VR](#ar-vr)
    * [Application Integration](#application-integration)
    * [Customer Engagement](#customer-engagement)
    * [Business Productivity](#business-productivity)
    * [Desktop & App Streaming](#desktop-app-streaming)
    * [Internet of Things](#internet-of-things)
    * [Game Development](#game-development)
* [IAM 101](#iam-101)
* [S3](#s3)


## 10,000 ft Overview

### AWS Global Infrastructure

* 16 Regions & 44 AZs - December 2017
* 6 regions + 17 AZs planned for 2018
* **Region** - Is a geographical area. Each Region consists of 2 (or more) AZs
* **Availability Zone (AZ)** - is simply a Data Center
* **Edge Locations** - Endpoints for AWS which are used for caching content. Typically this consists of CloudFront, Amazon's Content Delivery Network (CDN)

[TOC](#toc)


### Compute

* EC2 (Elastic Compute Cloud)
* ECS
* Elastic Beanstalk
* Lambda
* Lightsail (Virtual Private Service)
* Batch - Batch Computing)

[TOC](#toc)


### Storage

* S3 - Object based storage
* EFS
* Glacier
* Snowball
* Storage Gateway

[TOC](#toc)


### Databases

* RDS - MySQL, Aurora, PostgreSQL
* DynamoDB
* Elasticache - Cache database queries
* Red Shift (Data Wearhousing)

[TOC](#toc)


### Migration

* AWS Migration Hub - Tracking service as you migrate them to AWS
* Application Discovery Service - Track dependencies for your applications
* Database Migration Service (DMS) - Migrate your data to and from most widely used commercial and open-source databases such as Oracle, PostgreSQL, Microsoft SQL Server, Amazon Redshift, Amazon Aurora, Amazon DynamoDB, Amazon S3, MariaDB, and MySQL
* Server Migration Service - Migrate virtual and physical servers to AWS
* Snowball

[TOC](#toc)


### Networking & Content Delivery

* VPC (Virtual Private Cloud) - Virtual data centers
* CloudFront - CDN
* Route53 - DNS
* API Gateway - Create APIs for your other services to talk to
* Direct Connect - Run dedicated line from on-prem office to AWS

[TOC](#toc)


### Developer Tools 

_(Not in any associate exams, yet)_
* CodeStar - Project managing your code with other devs
* CodeCommit - Source Control
* CodeBuild - Compile, test, and package code
* CodeDeploy
* CodePipeline - CICD pipeline
* X-Ray
* Cloud9 - IDE (Acquisition)

[TOC](#toc)


### Management Tools

* **CloudWatch**
* **CloudFormation**
* **CloudTrail**
* **Config** - Monitors config of AWS environment and point-in-time backup, restore
* **OpsWorks** - Chef and Puppet automation
* Service Catalog - Managing available services
* Systmes Manager
* **Trusted Advisor** - Gives advice regarding security, service ussage
* Managed Services

[TOC](#toc)


### Media Services

* Elastic Transcoder - Media resizer
* MediaConvert, MediaLive, MediaPackage, MediaStore, MediaTailor

[TOC](#toc)


### Machine Learning

* SageMaker - Deep Learning (Neural Networks)
* Comprehend - Sentiment analysis around data
* DeepLens - Artificially aware camera. Physical piece of hardware.
* Lex - Powers the Amazon Alexa servers
* Machine Learning - Given large dataset, predict future results
* Polly - Text to speech service
* Rekognition - Recognizes what's in video, picture that you upload
* Amazon Translate - Translates between language 
* Amazon Transcribe - Automatic speech recognition and turns to text

[TOC](#toc)


### Analytics

* Athena - SQL queries against S3 buckets
* **EMR (Elastic Map Reduce)** - Processing large amount of data
* CloudSearch
* ElasticSearch Service
* **Kinesis** - Used to collect, process, and analyze real-time, streaming data
* Kinesis Video Streams - Ingest video streams
* QuickSight - A fast, cloud-powered business analytics (business intelligence) service that makes it easy to build visualizations, perform ad-hoc analysis, and quickly get business insights from your data.
* **Data Pipeline** - Move data between services
* Glue - ETL (Extract, Transform, Load) service

[TOC](#toc)


### Security & Identity & Compliance

* **IAM**
* Cognito - Device authentication to grant temp access to AWS services
* GuardDuty
* **Inspector** - Generate reports for 
* Macie - Scan S3 buckets for PII (Personal Identifiable Information)
* **Certificate Manager**
* **CloudHSM (Harware Security Module)**
* **Directory Services**
* **WAF (Web Application Firewall)** - Level 7 (application) firewall
* **Shield** - DDOS mitigation
* Artifact - Audit and Compliance. Download & inspecting documentation.

[TOC](#toc)


### Mobile Services

_Not on exams_
* Mobile Hub - Connect mobile app to AWS backend
* Pinpoint - Location targeted notifications to mobile
* App Sync
* DeviceFarm - Test app on real life devices
* Mobile Analytics

[TOC](#toc)


### AR / VR

* Sumerian (Beta Preview)


### Application Integration

* Step Functions - Manage order of lambda functions
* Amazon MQ
* **SNS**
* **SQS**
* **SWF (Simple WorkFlow)**

[TOC](#toc)


### Customer Engagement

* Connect - Call center
* **Simple Email Service**

[TOC](#toc)


### Business Productivity

* Alexa For Business
* Chime - Zoom meeting, Google Hangouts competitor
* **Work Docs** - Like google drive
* WorkMail

[TOC](#toc)


### Desktop & App Streaming

* Workspaces - VMs
* AppStream 2.0 - Stream application from cloud

[TOC](#toc)


### Internet of Things

* iOT
* iOT Device Management
* Amazon FreeRTOS
* Greengrass

[TOC](#toc)


### Game Development

* GameLift

[TOC](#toc)


## IAM 101

IAM allows you to manage users and their level of access to the AWS Console.

* IAM is universal. It does not apply to regions at this time
* The **root account** is the only account with complete Admin access by default
* All other accounts have **no access** by default


### Key Terms

* Users - End Users (think people)
* Groups - A collection of users under one set of permissions
* Roles - You create roles and can then assign them to AWS resources
* Policies - A JSON document that defines one (or more) permissions. Assign to Users, Groups, and Roles

[TOC](#toc)


## S3

[TOC](#toc)
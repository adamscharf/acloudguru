# Certified Solutions Architect - Associate

## TOC

* [10,000 ft Overview](#10000-ft-overview)
    * [AWS Global Infrastructure](#aws-global-infrastructure)
    * [Compute](#compute)
    * [Storage](#storage)
    * [Databases](#databases)
    * [Migration](#migration)
    * [Networking & Content Delivery](#networking--content-delivery)
    * [Developer Tools](#developer-tools)
    * [Management Tools](#management-tools)
    * [Media Services](#media-services)
    * [Machine Learning](#machine-learning)
    * [Analytics](#analytics)
    * [Security & Identity & Compliance](#security--identity--compliance)
    * [Mobile Services](#mobile-services)
    * [AR / VR](#ar--vr)
    * [Application Integration](#application-integration)
    * [Customer Engagement](#customer-engagement)
    * [Business Productivity](#business-productivity)
    * [Desktop & App Streaming](#desktop--app-streaming)
    * [Internet of Things](#internet-of-things)
    * [Game Development](#game-development)
* [IAM](#iam)
* [S3](#s3)
* [Storage Gateway](#storage-gateway)
* [Snowball](#snowball)
* [EC2](#ec2)
    * [Security Groups](#security-groups)
    * [EBS Volumes](#ebs-volumes)
    * [ELB](#elastic-load-balancers-elb)
    * [Placement Groups](#placement-groups)
* [CloudWatch](#cloudwatch)
* [EFS](#efs)
* [Lambda](#lambda)
* [Route53](#route53)


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

## IAM

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

* Data consistency model for s3
    * Read after write consistency for PUTS of new Objects
    * Eventual consistency for overwrite PUTS and DELETES (can take some time to propagate)
* Object based Key-value Store
    * Key (name of object)
    * Value (Data made up of a sequence of bytes)
    * Version ID
    * Metadata
    * Subresources:
        * Access Control Lists
        * Torrent
* Built for 99.99% availability for the s3 platform
* Amazon guarantees 99.9% availability
* 99.999999999% (11 x 9s) durability
* tiered storage available
* Lifecycle management
* Versioning
* Encryption Options
    * Client Side Encryption
    * Server Side Encryption
        * Amazon S3 Managed Keys (SSE-S3)
        * KMS (SSE-KMS)
        * Customer provided keys (SS$-C)
* Access Contol Lists & Bucket Policy
* By default buckets are private and all objects stored inside are private
* MFA Delete - requires additional authentication for either of the following operations:
    * Change the versioning state of your bucket
    * Permanently delete an object version
* S3 Transfer Acceleration
* Static website hosting
    * Url scheme: `http://<bucket_name>website.s3-website-<region>.amazonaws.com`
* Account limit of 100 buckets by default 

[TOC](#toc)

### S3 Storage Tiers/Classes

* S3 Standard
    * 99.99% availability, 99.999999999% durability
    * Built to sustain loss of 2 facilities concurrently
    * No retrieval cost
* S3 - IA (Infrequently Accessed)
    * Data that is accessed less frequently but requires rapid access when needed.
    * Lower cost than S3, but you are charged a retrieval fee
* S3 One Zone - IA (Reduced Redundancy)
    * Even lower cost but doesn't required multiple AZ data resilience
* Glacier
    * Very cheap data archival
    * Expedited (minutes), Standard (3-5 hrs), or Bulk (~12 hrs)

[TOC](#toc)

### Costs

* Storage
* Requests (Except S3 standard)
* Storage Management Pricing (tags, metadata)
* Data transfer pricing (CRR)
* Transfer acceleration (Use of CloudFront's CDN)

[TOC](#toc)

### Security & Encryption

* By default, all newly created buckets are **private**
* Access Control using:
    * Bucket Policies
    * Access Control Lists
* Access logs can log all requests made to the S3 bucket
* In transit encryption
    * SSL/TLS
* At Rest Encryption
    * Server Side
        * S3 Managed Keys - SSE-S3 (Most common)
        * Key Management Service, Managed Keys - SSE-KMS (provides audit trail)
        * Customer Provided Keys - SSE-C
    * Client Side Encryption

[TOC](#toc)

## CloudFront

* Edge Location - This is the location where content will be cached. This is separate to an AWS Region/AZ
    * Not just read only
* Origin - Origin of all the files that the CDN will distribute
    * S3 Bucket, EC2 Instance, ELB, or Route53
* Distribution - Name given to the CDN which consists of a collection of Edge Locations
    * Web Distribution - Typically used for websites
    * RTMP - Used for media streaming
* Objects are cached for the life of the TTL
* You can clear cached objects, but you will be charged

[TOC](#toc)

## Storage Gateway

* Virtual appliance that you install in your on-prem data centers to replicate data to AWS
* 4 Types
    * File Gateway (NFS) - Flat files, stored directly on S3
    * Volumes gateway (iSCSI) - Block based storage (OS installable). Virtual hard disks that incrementally backup to AWS.
        * Stored Volumes  - Entire dataset is stored on site (locally) and is asynchronously backed up to S3
        * Cached Volumes - Entire dataset is store on S3 and the most frequently accessed data is cached on site (locally)
    * Tape Gateway (VTL)
        * Used for backup and uses popular backup applications like NetBackup, Backup Exec, Veeam etc.

[TOC](#toc)

## Snowball

* Snowball
* Snowball Edge - 100TB data transfer
* Snowmobile
* Snowball can:
    * Import to S3
    * Export from S3

[TOC](#toc)

## EC2

* Termination protection is turned off by default
* EBS-backed instance, the default action is for the root EBS volume to be deleted when the intance is terminated
* EBS Root Volumes of your DEFAULT AMI's cannot be encrypted, BUT it can be done by either of the following methods:
    * Use a third party tools (bit locker, etc.) to encrypt the root volume
    * Create a custom AMI in the AWS console or using the API
* Additional volumes can be encrypted
* **Instance Metadata**
    * `curl http://169.254.169.254/latest/meta-data/`
* AMIs are regional, but can be copied across regions

### Instance Types

| Family | Speciality | Use Case |
| :----: | ---------- | -------- |
| F1 | Field programmable Gate Array | Genomics research, financial analytics, real-time video processing, big data, etc.|
| I3 | High speed storage | NoSQL DBs, Data Warehousing, etc |
| G3 | Graphics intensive | Video encoding/3D application streaming |
| H1 | High disk throughput | MapReduce-based workloads, distributed file systems such as HDFS and MapR-FS |
| T2 | Lowest cost, general purpose | Web servers/small DBs |
| D2 | Dense storage | Fileservers, data warehousing, hadoop |
| R4 | Memory optimized | Memory intensive Apps/DBs |
| M5 | General purpose | Application servers |
| C5 | Compute optimized | CPU Intensive Apps/DBs |
| P3 | Graphics/General Purpose GPU | Maching learning, BitCoin Mining, etc. |
| X1 | Memory Optimized | SAP HANA/Apache Spark, etc |

#### FIGHT DR MC PX

![FIGHT DR MC PX](/img/ec2-acronym.png "FIGHT DR MC PX")

### Security Groups

* Virtual firewall
* All inbound traffic is blocked by default
* All outbound traffic is allowed
* Changes to SGs take effect immediately
* you can have any number of EC2 instances within a SG
* you can have multiple groups attached to EC2 instances
* SGs are **STATEFUL**
    * If you create an inbound rule allowing traffic in, that traffic is automatically allowed back out
* You cannot block specific IP address using SGs, instead use NACLs
* You can specify allow rules, but not deny rules

### EBS

**Elastic Block Store**

* Volumes exist on EBS:
    * Virtual Hard disk
* Snapshots exist on S3
* Snapshots are point in time copies of volumes
* Snapshots are incremental - this means that only the blocks that have changed since your last snapshot are moved to S3
* To create a snapshot for **root device** EBS volumes, you should stop the instance, but it's not required.
* You can create AMI's from EBS-backed Instances and Snapshots
* You can changes EBS volume sizes on the fly, including changing the size and storage type.
* Volumes will **always** be in the same AZ as the EC2 instance 
* To move an EC2 volume from one AZ/Region to another, take a snap or an AMI of it, then copy it to the new AZ/Region.
* Cannot mount 1 EBS volume to multiple EC2 instances; instead use [EFS](#efs)

#### EBS Types

* GP2 - SSD, General Purpose (Up to 10,000 IOPS)
* IO1 - SSD, Provisioned IOPS (Up to 32,000 IOPS)
* ST1 - HDD, Throughput optimized, frequently accessed workloads
* SC1 - HDD, Cold - less frequently accessed data
* Standard - HDD, Magnetic - cheap, infrequently accessed storage

#### EBS vs Instance Store

* Instance store volumes are sometimes called ephemeral storage
* Instance store volumes cannot be stopped. If the underlying host fails, you will lose your data.
* EBS backed instances can be stopped. You will **not** lose the data on this instance if it is stopped.
* You can reboot both, you will not lose your data.
* By default, both ROOT volumes will be deleted on termination; however, with EBS volumes, you can tell AWS to keep the root device volume.

#### Volumes & Snapshots - Security

* Snapshots of encrypted volumes are encrypted automatically
* Volumes restored from encrypted snapshots are encrypted automatically
* You can share snapshots, but only if they are unencrypted
    * These snapshots can be shared with other AWS accounts or made public
* Snapshot of RAID array:
    * Stop the application from writing to disk
    * Flush all caches to the disk
    * Done by one of the following:
        1. Freeze the file system
        2. Unmount the RAID array
        3. Shutting down the associated EC2 instance

[TOC](#toc)

### Elastic Load Balancers (ELB)

* 3 Types of Load Balancers
    * **Application Load Balancers** (Layer 7)
    * **Network Load Balancers** (Layer 4)
    * **Classic Load Balancers** (Deprecated. Mostly layer 4, some layer 7)
* 504 error means the gateway has timed out
    * Application is not responding within the idle timeout period
    * Troubleshoot the application. Is it the web server or database server
* If you need the IPv4 address of your end user, look for the `X-Forwarded-For` header

[TOC](#toc)

### Placement Groups

_Popular exam topic_

* Two types of placement groups
    1. Clustered placement group
    2. Spread Placement group
* For the exam, assume it's talking about clustered placement group unless it states otherwise

#### Clustered placement group

* Grouping of instances within a **single AZ.**
* Recommended for applications that need low network latency, high network throughput, or both.
* Only certain instances can be launched into a Clustered Placement Group
* Requires unique name within AWS account

#### Spread Placement group

* Grouping of instances that are each placed on distinct underlying hardware
* Recommended for applications that have a small number of critical instances that should be kept separate from each other
* _Can_ spread across multiple AZs
* Released at re:Invent 2017

[TOC](#toc)

## CloudWatch

* Standard Monitoring = 5 min
* Detailed Monitoring = 1 min (cost extra)
* Dashboards, Alarms, Events, Logs

[TOC](#toc)

## EFS

**Elastic File System**

* File storage service for EC2 instances
* Only pay for the storage you use (no pre-provisioning required)
* Read after Write Consistency
* Works well for a file server
* Can be attached to multiple EC2 instances, unlike [EBS](#ebs-volumes)

[TOC](#toc)

## Lambda

* Event-based compute
    * 1 event = 1 (or more) function
* Scalles out (not up) automatically
* Lambda triggers:
    * **API Gateway**
    * AWS IoT
    * **Alexa Skills Kit**
    * **Alexa Smart Home**
    * **CloudFront**
    * **CloudWatch Events**
    * **CloudWatch Logs**
    * CodeCommit
    * Cognito Sync Trigger
    * **DynamoDB**
    * **Kinesis**
    * **S3**
    * **SNS**
* Languages:
    * C# (.Net Core)
    * Go
    * Java
    * Node.js
    * Python
* Priced by number of requests
    * First 1 million requests are free. $0.2.0 per 1 million requests thereafter
* Priced by duration
    * 5 min limit

[TOC](#toc)

## Route53

### DNS 101

#### SOA Records

* Start of Authority Record
* Name of the server that supplied the data for the zone
* Admin of the zone
* Current version of the data file
* Number or seconds a seconday name server should wait before checking for updates
* Number of seconds a seconday server should wait before retrying a failed zone transfer
* Max number of seconds that a secondary name server can use data before it must either be refreshed or expire
* Default number of seconds for the TTL file on resource records

#### NS Records

* Name Server records. Used by Top level domain servers to direct traffic to the Content DNS server which contains the au

#### A Records 

* Address Records
* The fundamental type of DNS record
* Used to translate domain to IP address
* **CANNOT** be used to point to an ELB becuase ELBs only have DNS names. Must use an [alias record](#alias-records) instead
* Example: 
    
| Domain Name            | IP Address          |
| ---------------------- | ------------------- |
| http://www.acloud.guru | http://123.10.10.80 |

#### TTL Record

* Length that a DNS record is cached on either the Resolving Server or the users own local PC is equal to the "Time To Live" (TTL) in seconds.
* Lower the TTL, the faster changes to DNS records take to propagate throughout the internet

#### CNAMES

* Canonical Name (CName) - Used to resolve one domain to another
* Example:

| CNAME                     | Domain Name        |
| ------------------------- | ------------------ |
| http://mobile.acloud.guru | http://acloud.guru |
| http://m.acloud.guru      | http://acloud.guru |

#### Alias Records

* Created by AWS
* Used to map resource record sets in your hosted zone to ELBs, CloudFront distributions, or S3 buckets that are configured as websites
* Work like a CNAME - let you map one DNS name (www.example.com) to another 'target' DNS name (elb1234.elb.amazonaws.com)
* **Key difference** - A CNAME can't be used for naked domain names (zone apex). You can't have a CNAME for http://acloud.guru, it must be either an A record or an Alias record
* Can automatically detect changes in the record set (e.g., ELB DNS) and automatically reflect those changes in your hosted zone
* Given the choice, **always** choose an Alias Record and CNAME

[TOC](#toc)

### Route53 Routing Policies

* **Simple**
    * Default routing policy when you create a new record set
    * Simple round-robin routing
    * Most commonly used when you have a single resource that perfoms a given function for your domain
* **Weighted**
    * Allows you to split your traffic based on different weights assigned
    * e.g., 10% to `us-east-1` and 90% to `eu-west-1`
* **Latency**
    * Route traffic based on the lowest network latency for your end user (i.e., which region will give them the fastest response time)
    * Create a latency alias record set in the region where your ELBs are
* **Failover**
    * Used to create an active/passive setup. e.g., primary site in `eu-west-2` and DR site in `ap-southeast-2`
    * Route53 will monitor the health of your primary site using a health check
    * Need to create health checks in Route53
* **Geolocation**
    * Choose where traffic will be sent based on geographic location of your users (i.e., location from which DNS queries orginate)
    * e.g., All queries from Europe route to servers with European specific content

[TOC](#toc)

## RDS

* Used for OLTP (Online Transaction Processing)
* Supported Types
    * SQL Server
    * Oracle
    * MySQL
    * PostgreSQL
    * Amazon Aurora
    * MariaDB

### Backups, Multi-AZ, & Read Replicas

* Backup (automatic)
    * 7-35 day retention period
* DB Snapshots
    * Done manually
    * Unlimited retention period
* Multi-AZ
    * Synchronous backup to a secondary intance in a separate AZ
    * Automatic failover
    * **For disaster recovery only**
    * For performance improvements, use read replicas
* Read Replica
    * 5 read replicas per production DB by default
    * Spread read load across multiple 
    * Read-only copy of your prod database
    * Asynchronous replication from the primary RDS instance to the read replica
    * Used for scaling, **not** for DR!
    * Available for:
        * MySQL
        * PostgreSQL
        * Aurora
        * MariaDB

### Aurora

* MySQL-compatible, relation DB engine
* Incredibly performant, affordable
* Start with 10GB, scales in 10GB increments to 64 TB (storage autoscaling)
* 2 copies of your data in contained in each AZ with min of 3 AZ. 6 copies of data
* Desigend to handle loss of up to 2 copies of data without affecting database write availability and up to 3 copies without affecting read availability
* Self-healing
* 2 types of replicas
    * Aurora Replicas (currently 15) - automatic failover
    * MySQL Read replicas (currently 5)

[TOC](#toc)

## DynamoDB

* NoSQL database service
* Always on SSD storage
* Spread across 3 geographically distinct data centers
* Consistency models
    * Eventual Consistent Reads
    * Strongly Consistent Reads
* Push-button scaling with no downtime
* Read is much cheaper than writes

[TOC](#toc)

## RedShift

* Fully managed, petabyte-scale data warehouse service in the cloud
* Much more affordable than other data warehousing solutions
* OLAP (Online Analytical Processing)
* Config
    * Single node (160Gb)
    * Multi-Node
        * Leader Node (manages client connections and receives queries)
        * Compute Node (stores data and perform queries and computations).
            * Up to 128 Compute Nodes
* Columnar Data Storage
    * Instand of rows, Redshift organizes by column
    * Data stored sequentially, meaning faster, less IO queries
* Advanced compression by default
* Massively Parallel Processing (MPP)
* Encrypted in transit using SSL and at rest using AES-256
* Only available in 1 AZ

[TOC](#toc)

## Elasticache

* Web service that makes it easy to deploy, operate, and scale an in-memory cache in the cloud
* Used to improve latency for read-heavy applications
* Types of Elasticache:
    * **Memcached** - Widely adopted memory object caching systm
    * **Redis** - Open-source in-memory key-value store

[TOC](#toc)


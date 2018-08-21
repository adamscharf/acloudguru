# Exam Tips

* Understand the difference b/n a region, an AZ, and an Edge Location
    * A Region is a physical location in the world which consists of two or more AZs
    * An AZ is one or more discrete data centers, housed in separate facilities.
    * Edge Locations are endpoints for AWS which are used for caching content. Typically this consists of CloudFront, Amazon's Content Delivery Network (CDN)
* S3
    * Object-based (upload files)
    * Files can be 0 Bytes to 5 TB
    * Unlimited storage
    * Files stored in buckets
    * S3 is universal namespace. Names must be unique globally.
    * Example URLs
        * S3 Bucket: `https://s3-<region_name>.amazonaws.com/<bucket_name>`
        * S3 Static Website: `http://<bucket_name>website.s3-website-<region>.amazonaws.com`
    * Read after write consistency for PUTS of **new objects**
    * Eventual consistency for overwrite PUTS and DELETES (can take some time to propagate)
    * Storage tiers
        * S3 (durable, immediately available, frequently accessed)
        * S3 - IA (Durable, immediately available, infrequently accessed)
        * S3 One Zone - IA (even cheaper than IA, but only in one AZ)
        * Glacier (achived data, where you can wait 3-5 hours before accessing)
        * Reduced Redundancy Storage (deprecated)
            * 99.99% durability
    * S3 object
        * Key
        * Value
        * Version ID
        * Metadata
        * Subresources
            * ACL
            * Torrent
    * **Not suitable to install an OS on**
    * Successfull uploads will result in 200 HTTP status code
    * **_Read the S3 FAQs_**
    * Versioning
        * Stores all versions of an object (including all writes and even if you delete an object)
        * Great backup tool
        * Once enabled, versioning cannot be disabled, only suspended
        * Integrates with lifecycle rules
        * Versionings's MFA delete capability can be used to provide an additional layer of security
    * Cross Region Replication
        * Versioning must be enabled on both the source and destination buckets
        * Regions must be unique
        * Files in existing bucket are not replicated. Only subsequent files
        * You cannot daisy chain replication
        * Delete markers are replicated
        * Deleting individual versions (or delete markers) will **not** be replicated
        * Understand what CRR is at a high level
    * Lifecycle Management
        * Can be used with versioning
        * Can be applied to current versions and previous versions
        * Following actions can be done:
            * Transition to Standard - IA
            * Archive to glacier storage
            * Permanently delete



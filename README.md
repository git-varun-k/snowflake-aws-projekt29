# Spotify Data Pipeline using AWS & Snowflake

This project implements a serverless ETL pipeline to extract, transform, and load Spotify data using:
- **AWS Lambda** (Python)
- **Amazon S3**
- **Snowflake Snowpipe**

## Architecture

![Architecture Diagram](architecture.png)

## Components

- **Extract**: Python Lambda fetches Spotify data and stores in S3
- **Transform**: Another Lambda cleans/transforms data
- **Load**: Snowpipe auto-ingests transformed data into Snowflake for analysis

## Setup Instructions

1. Configure Spotify API credentials
2. Set up AWS S3 buckets and Lambda IAM roles
3. Deploy Lambda functions and CloudWatch triggers
4. Create Snowflake table and Snowpipe

## Folder Structure

Explain folders briefly...

## Security Notes

- Never commit secrets or credentials
- Use AWS Secrets Manager or environment variables

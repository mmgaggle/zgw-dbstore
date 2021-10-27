#!/usr/bin/python3

import boto3
import logging
import sys
import os
import time
import datetime
import pytz
import re
import json
import pdb

#boto3.set_stream_logger(name='botocore')

bucket_name = sys.argv[1]

rgw_host = os.environ['RGW_HOST']
rgw_port = int(os.environ['RGW_PORT'])
access_key = os.environ['RGW_ACCESS_KEY']
secret_key = os.environ['RGW_SECRET_KEY']

endpoint='http://%s:%d' % (rgw_host, rgw_port)

client = boto3.client('s3',
                      endpoint_url=endpoint,
                      aws_access_key_id=access_key,
                      aws_secret_access_key=secret_key)

res = client.create_bucket(Bucket=bucket_name)

'''
Selects EC2 based on value of 'Stop' tag
'''

import boto3

def lambda_handler(event, context):
    ec2_stop_tag = event['Stop']
    ec2_region = event['Region']
    stop_instances = []
    ec2 = boto3.resource('ec2',region_name=ec2_region)

    instances = ec2.instances.filter(Filters=[{'Name':'tag:Stop','Values':[ec2_stop_tag]},{'Name': 'instance-state-name', 'Values': ['running']}])

    for instance in instances:
        print('Stopping: ' + instance.id)
        stop_instances.append(instance.id)

    if len(stop_instances) > 0:
        ec2_stop = boto3.client('ec2',region_name=ec2_region)
        ec2_stop.stop_instances(InstanceIds=stop_instances)
    else:
        print('No instances to stop')

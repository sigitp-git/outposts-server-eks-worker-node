import boto3

def lambda_handler(event, context):
    cloudwatch = boto3.client('cloudwatch')
    pod_name = event['detail']['pod_name']  # Assumed event structure
    namespace = event['detail']['namespace']

    # Define the alarm
    alarm_name = f"High-CPU-{pod_name}"
    cloudwatch.put_metric_alarm(
        AlarmName=alarm_name,
        MetricName='CPUUtilization',
        Namespace='AWS/EKS',
        Statistic='Average',
        Dimensions=[
            {'Name': 'PodName', 'Value': pod_name},
            {'Name': 'Namespace', 'Value': namespace}
        ],
        Period=300,
        EvaluationPeriods=1,
        Threshold=80,
        ComparisonOperator='GreaterThanThreshold',
        AlarmActions=['arn:aws:sns:us-east-1:1234567890:EKS-Cluster-Name-Pod-High-CPU'],  # SNS topic ARN
        AlarmDescription='Alarm when CPU exceeds 80%'
    )

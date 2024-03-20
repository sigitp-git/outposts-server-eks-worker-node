#!/bin/sh

set -e

INSTANCE_ID="i-0536954ab277adfadfadsf"

TMP_JSON=$(aws ec2 \
        --output json \
        describe-instances --instance-id "$INSTANCE_ID"
)

SUBNET_ID=$(printf '%s' "$TMP_JSON" | jq -r ".Reservations[0].Instances[0].SubnetId"
)

echo "Creating LNI on instance $INSTANCE_ID"

echo Subnet = "$SUBNET_ID"

TAGS='ResourceType=network-interface,Tags=[{Key=Name,Value=LNI '$INSTANCE_ID'},{Key=node.k8s.amazonaws.com/no_manage,Value=true}]'

TMP_JSON=$(aws ec2 \
        --output json \
        create-network-interface \
        --subnet-id "$SUBNET_ID" \
        --tag-specifications "$TAGS"
)

ENI_ID=$(printf '%s' "$TMP_JSON" | jq -r ".NetworkInterface.NetworkInterfaceId"
)

echo "Created ENI $ENI_ID"

aws ec2 \
        modify-subnet-attribute \
        --subnet-id "$SUBNET_ID" \
        --enable-lni-at-device-index "$DEVICE_INDEX"

TMP_JSON=$(aws ec2 \
        attach-network-interface \
        --instance-id "$INSTANCE_ID" \
        --network-interface-id "$ENI_ID" \
        --device-index "$DEVICE_INDEX"
)

ENI_ATTACH_ID=$(printf '%s' "$TMP_JSON" | jq -r ".AttachmentId")

echo "Enabling delete-on-termination"

aws ec2 modify-network-interface-attribute \
        --network-interface-id "$ENI_ID" \
        --attachment AttachmentId=$ENI_ATTACH_ID,DeleteOnTermination=true

echo "Finished creating LNI at device index $DEVICE_INDEX"

echo "ENI Attachment ID = $ENI_ATTACH_ID"

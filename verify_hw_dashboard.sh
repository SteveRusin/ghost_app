#! /bin/bash

REGION=eu-west-1
DASHBOARD=cloud_dashboard
aws cloudwatch get-dashboard --dashboard-name $DASHBOARD --region $REGION | jq -c '.DashboardBody | fromjson' | jq '.widgets[] | [.properties.title, .type]'


#!/bin/bash
# by bill roth

curl -u "<YourAPIKey>:" -H "Accept: application/vnd.unbounce.api.v0.4+json" -X GET https://api.unbounce.com/pages\?with_stats=true\&limit=100 | \
jq -c -r '.pages[]| "\(.url) \(.id) \(.state) \(.tests.current.visits) \(.tests.current.visitors) \(.tests.current.clicks) \(.tests.current.conversions)"' |\
sed 's/https\:\/\///g' |\
awk -f /home/broth/code/unbounce/pjq.awk  |\
nc localhost 2878
logger "pulled unbounce data"

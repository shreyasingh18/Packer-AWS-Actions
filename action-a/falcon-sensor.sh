#!/bin/bash
ID=50b9e62df8af48af820687e52455295f
SECRET=Hrn1xB5w3M9lZV4gojC8v7E20UAQezqYFSNXh6dp
TOKEN=$( curl -X POST "https://api.crowdstrike.com/oauth2/token" -H "accept: application/json" -H "Content-Type: application/x-www-form-urlencoded" -d "client_id=$ID&client_secret=$SECRET" | jq -r '.access_token')
curl -X GET "https://api.crowdstrike.com/sensors/entities/download-installer/v1?id=fd04a4c3e560ca061cd13430e0ec04fd4a827cd487ac8a41b8a8f43949eae5b6" -H "accept: application/json" -H "authorization: bearer $TOKEN" --output /tmp/falcon-sensor.deb
sudo apt install -y /tmp/falcon-sensor.deb
sleep 20s
sudo rm /tmp/falcon-sensor.deb

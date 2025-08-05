#!/usr/bin/env nu
docker ps -a --format json | lines | each {from json} | filter {$in.State != "running"} | each {docker rm $in.ID}
null

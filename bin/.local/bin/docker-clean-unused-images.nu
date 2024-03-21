#!/usr/bin/env nu
docker images --format json | lines | each {from json} | filter {$in.Repository == "<none>"} | each {docker rmi $in.ID}
null

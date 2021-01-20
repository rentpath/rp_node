Docker base for node projects

## how to tag a new image

- modify Dockerfile to taste
- build image and tag (example below)
  - `docker build . -t rentpath/rp_node:node-v14.15.4_yarn-v1.22.5`
- push it
  - `docker push rentpath/rp_node:node-v14.15.4_yarn-v1.22.5`

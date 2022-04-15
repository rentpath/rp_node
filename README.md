Docker base for node projects

# UPDATING THE BASE IMAGE

## Updating the Alpine version

Edit `.alpine-version`.

## Updating the Debian version

Edit `.debian-version`.

## Updating the NodeJS version

Edit `.node-version`.

## Updating the Yarn version

Edit `.yarn-version`.

# RELEASING A NEW BASE IMAGE

By default, new base images for both Linux distros will be built, pushed, tagged, and released
when a PR is merged into `main`.

If you want more control over what is released, you may run the `release` workflow manually.

## Example: Release a base image with a specific version of Alpine, using the default versions for `node` and `yarn`

Supply a value for the `alpine_version` input. Leave the others blank.

## Example: Release a base image with a specific version of Debian, using the default versions for `node` and `yarn`

Supply a value for the `debian_version` input. Leave the others blank.

## Example: Release a base image with a specific version of Alpine and `node`, using the default version for `yarn`

Supply values for the `alpine_version` and `node_version` inputs. Leave the others blank.

## Example: Release base images for the default versions of both distros, with a specific version of `yarn`, and the default version for `node`

Supply a value for the `yarn_version` input. _Leave both `alpine_version` and `debian_version` blank_. Leave `node_version` blank.
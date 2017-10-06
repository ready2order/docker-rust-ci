# docker-rust-ci

Dockerfile for a [Rust](https://rust-lang.org) Docker image intended for **CI 
jobs**.

In addition to rustc and cargo, the image contains 
[rustfmt](https://github.com/rust-lang-nursery/rustfmt) and 
[Clippy](https://github.com/rust-lang-nursery/rust-clippy), which are usually
required for CI jobs but take a long time to build.

## Tags

* nightly (latest nightly, built daily)
* nightly-YYYY-MM-DD (specific nightlies)

## Image

* Based on debian:testing
* Contains **rustfmt** and **clippy** for validating the source code.

A Travis cron job is used to publish the image daily with a tag for the current 
nightly and publish it to docker hub.

(Docker hub user/pw are stored in Gitlab job env config on the repo)

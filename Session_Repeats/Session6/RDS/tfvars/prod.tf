# This is env for the snapshot in rds.tf line 10 skip_final_snapshot
# for the dev environment we set the skipping snapshot to true but for
# the prod environment we make it false so it will create a snapshot

env = "prod"
skip_snapshot = false 
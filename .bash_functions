#################
#   git stuff   #
#################
function parse_git_branch {
  val=`git_branch_name | sed 's_\(.*\)_(\1)_'`
  echo "$val"
}

function git_branch_name {
  val=`git branch 2>/dev/null | grep '^*' | colrm 1 2`
  echo "$val"
}

function git-nuke {
  git branch -D $1 && git push origin :$1
}

function pll {
  branche=`git_branch_name`
  git pull origin $branche
}

function psh {
  branche=`git_branch_name`
  git push origin $branche
}

#################
#   dba stuff   #
#################
function pg_replica {
	psql -h $ECS_REPLICA_HOST -U $ECS_REPLICA_USERNAME -d $ECS_REPLICA_DBNAME -p $ECS_REPLICA_PORT
}

function pg_redshift {
	psql -h $ECS_REDSHIFT_HOST -U $ECS_REDSHIFT_USERNAME -d $ECS_REDSHIFT_DBNAME -p $ECS_REDSHIFT_PORT
}

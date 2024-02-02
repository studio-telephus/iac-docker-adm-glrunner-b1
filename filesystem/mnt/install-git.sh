#!/usr/bin/env bash
: "${GIT_USERNAME?}"
: "${GIT_TOKEN?}"
: "${GIT_DOMAIN?}"

export cred_home="/home/gitlab-runner"

echo "Create GitLab credentials file"
cat << EOF > ${cred_home}/.my-git-credentials
https://${GIT_USERNAME}:${GIT_TOKEN}@${GIT_DOMAIN}
EOF

echo "Set ownership & permissions of .my-git-credentials"
chmod 644 ${cred_home}/.my-git-credentials

echo "Add Github credentials to git global config file"
cat << EOF > ${cred_home}/.gitconfig
[credential]
	helper = store --file ${cred_home}/.my-git-credentials
[user]
	user = ${GIT_USERNAME}
	email = ${GIT_USERNAME}@${GIT_DOMAIN}
EOF

echo "Set ownership & permissions"
chmod 644 ${cred_home}/.gitconfig
chown -R gitlab-runner:gitlab-runner /home/gitlab-runner

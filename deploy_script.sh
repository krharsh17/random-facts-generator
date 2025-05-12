chmod 400 deploy_key
eval $(ssh-agent -s)
ssh-add deploy_key
mkdir -p ~/.ssh
chmod 700 ~/.ssh
ssh-keyscan -t rsa $SERVER_IP >> ~/.ssh/known_hosts
ssh $UPCLOUD_USERNAME@$SERVER_IP /bin/bash << 'EOT'
  cd random-facts-generator
  git pull origin main
  yarn
  yarn restart:prod
EOT
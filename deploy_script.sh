eval $(ssh-agent -s)
chmod 400 deploy_key
ssh-add deploy_key
ssh -o StrictHostKeyChecking=no $UPCLOUD_USERNAME@$SERVER_IP /bin/bash << 'EOT'
  git pull origin main
  yarn
  yarn restart:prod
EOT
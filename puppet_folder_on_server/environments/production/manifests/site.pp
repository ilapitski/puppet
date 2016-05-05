File { backup => false }

node default {
  notify { "${::environment} puppet environment": }
}


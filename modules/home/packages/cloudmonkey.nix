{ config, pkgs, ... }:

{
  # CloudStack credentials loaded from ~/.config/cloudstack/env (not tracked in git)
  # Create that file with:
  #   export CLOUDSTACK_API_URL="http://..."
  #   export CLOUDSTACK_API_KEY="..."
  #   export CLOUDSTACK_SECRET_KEY="..."
  home.shellAliases = {
    cmk = "cloudstack-cloudmonkey -u $CLOUDSTACK_API_URL -k $CLOUDSTACK_API_KEY -s $CLOUDSTACK_SECRET_KEY";
    cloudmonkey = "cloudstack-cloudmonkey -u $CLOUDSTACK_API_URL -k $CLOUDSTACK_API_KEY -s $CLOUDSTACK_SECRET_KEY";
  };
}

{ pkgs, user, ... }: {
  # Define a user account. Don't forget to set the password with ‘passwd’.
  users.users.${user} = {
    isNormalUser = true;
    description = "${user}";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    initialPassword = "password";
    shell = pkgs.zsh;
    packages = with pkgs;[ ];
  };

  # user shell
  programs.zsh.enable = true;

  environment.variables = {
    EDITOR = "nixCats";
    SHELL = "zsh";
    TERM = "kitty";
    TERMINAL = "kitty";
  };

  # need both shells otherwise weird things can happen with user accounts
  environment.shells = with pkgs;
    [ bashInteractive zsh ];
}

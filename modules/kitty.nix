{ config, ... }:
{
  programs.kitty.enable = true;
  home.file.".config/kitty".source = ./configs/kitty;
}

{ pkgs, ... }: {
  # Fonts
  fonts.packages = with pkgs; [
    fira-code
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    font-awesome
    twemoji-color-font
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
  ];
}

{ ... }:

{
  programs.zsh = {
  enable = true;
  enableCompletion = true;
  autosuggestions.enable = true;

  syntaxHighlighting = {
    enable = true;
    highlighters = [ "main" "brackets" ];

    styles = {
      command              = "fg=#c7cfff";
      alias                = "fg=#5ea1ff,bold";
      builtin              = "fg=#5eff6c";
      function             = "fg=#5ef1ff";
      path                 = "fg=#5ef1ff";
      string               = "fg=#ffb65e";
      globbing             = "fg=#f1ff5e";
      reserved-word        = "fg=#ff5ea0,bold";
      command-substitution = "fg=#5eff6c";
      unknown-token        = "fg=#ff6e5e";
      undefined-command    = "fg=#ff6e5e,bold";
      comment              = "fg=#242937";
    };
  };

  shellAliases = {
    update = "sudo nixos-rebuild switch";
    edit = "sudo hx /etc/nixos/";
    nclean = "sudo nix-collect-garbage -d";
    nopt = "sudo nix store optimise";
    nlist = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
    ninfo = "nix-shell -p nix-info --run \"nix-info -m\"";
    ll = "ls -lah";
    la = "ls -A";
    ".." = "cd ..";
    "..." = "cd ../..";
  };
};

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
    programs.starship = {
    enable = true;

    settings = {
      scan_timeout = 10;
      command_timeout = 500;

      format = "(bold overlay1) $username$directory$git_branch$git_status$character ";

      palette = "cyberdream";

      palettes.cyberdream = {
        color_blue   = "#5ea1ff";
        color_aqua   = "#5ef1ff";
        color_green  = "#5eff6c";
        color_orange = "#ffb65e";
        color_red    = "#ff6e5e";
        color_yellow = "#f1ff5e";
        color_pink   = "#ff5ea0";
        overlay1     = "#242937";
        text         = "#c7cfff";
      };

      username = {
        show_always = true;
        style_user = "fg:text bold";
        style_root = "fg:red bold";
        format = "[$user ]($style)";
      };
      
      directory = {
        style = "fg:color_blue bold";
        format = "[$path ]($style)";
        truncation_length = 3;
        truncation_symbol = ".../";
      };

      git_branch = {
        style = "fg:color_yellow";
        symbol = "git:";
        format = "on [$symbol $branch ]($style)";
      };

      git_status = {
        style = "fg:color_orange";
        format = "([$all_status ]($style))";
      };

      git_commit = {
        disabled = true;
      };

      character = {
        format = "[>](fg:white bold)";
        success_symbol = "[>](fg:text bold)";
        error_symbol   = "[>](fg:red bold)";
      };

      python = { disabled = true; };
      conda  = { disabled = true; };
    };
  };
}

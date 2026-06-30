{ ... }:
{
  personal.zsh = {
    homeManager = { ... }: {
      programs.zsh = {
        enable = true;

        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        history = {
          size = 10000;
          save = 10000;
          ignoreSpace = true;
          ignoreAllDups = true;
          share = true;
        };

        shellAliases = {
          ls = "eza --icons";
          ll = "eza -l --icons";
          la = "eza -la --icons";
          tree = "eza --tree --icons";

          cat = "bat";

          gs = "git status";
          ga = "git add";
          gc = "git commit";
        };

        sessionVariables = {
          MANPAGER = "sh -c 'col -bx | bat -l man -p'";
          MANROFFOPT = "-c";
        };
      };

      programs.starship = {
        enable = true;
        enableZshIntegration = true;

        settings = {
          add_newline = false;

          format = "$directory$git_branch$git_status$character";

          directory = {
            style = "bold #d79921";
            read_only = " 󰌾";
            truncation_length = 3;
            truncate_to_repo = false;
          };

          git_branch = {
            style = "bold #b8bb26";
            format = "[$symbol$branch]($style) ";
          };

          git_status = {
            style = "bold #fb4934";
            format = "([$all_status$ahead_behind]($style) )";
          };

          character = {
            success_symbol = "[❯](bold #b8bb26)";
            error_symbol = "[❯](bold #fb4934)";
          };
        };
      };
    };

    nixos = { pkgs, ... }: {
      programs.zsh.enable = true;
      users.users.csimms.shell = pkgs.zsh;
    };

    darwin = { pkgs, ... }: {
      programs.zsh.enable = true;
      users.users.csimms.shell = pkgs.zsh;
    };
  };
}

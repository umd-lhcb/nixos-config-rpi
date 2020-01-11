{ config, pkgs, lib, ... }:

{
  programs.tmux = {
    enable = true;

    extraTmuxConf = ''
      # History
      set -g history-limit 2000

      # Start window numbering at 1
      set -g base-index 1

      # Dynamic window renaming
      set  -g set-titles on
      set  -g set-titles-string '#S:#I.#P #W'
      setw -g automatic-rename on

      # Set the prefix to Ctrl-A.
      set -g prefix ^A
      unbind ^A
      unbind ^B

      # Command sequence for nested tmux sessions
      bind a send-prefix

      # Go to last active window
      bind ^A last-window

      # Create a new window
      unbind c
      bind   c new-window

      # Detach from current server
      unbind ^D
      bind   ^D detach
      unbind d
      bind   d detach

      # Move among windows
      unbind n
      bind   n next-window
      unbind p
      bind   p previous-window

      # Kill current window (useful in terminating zombie processes)
      unbind k
      bind   k confirm-before "kill-window"

      # Kill current session
      unbind i
      bind   i confirm-before "kill-session"

      # List windows (useful when have more than 10 windows)
      unbind b
      bind   b list-windows

      # Split window horizontally
      bind | split-window -h
    '';
  };
}

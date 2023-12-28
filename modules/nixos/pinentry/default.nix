{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    pinentry-gnome
  ];

  # fixes error: "No Gcr System Prompter available, falling back to curses"
  services.dbus.packages = [ pkgs.gcr ];

  programs.gnupg.agent.pinentryFlavor = "gnome3";
}
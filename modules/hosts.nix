# defines all hosts + users + homes.
# then config their aspects in as many files you want
{
  den.hosts.x86_64-linux.desktop.users.csimms = { };

  den.homes.x86_64-linux.csimms = { };

  den.hosts.aarch64-darwin.apple.users.alice = { };

  # other hosts can also have user tux.
  # den.hosts.x86_64-linux.south = {
  #   users.tux = { };
  #   users.orca = { };
  # };
}

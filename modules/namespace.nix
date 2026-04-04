{ inputs, den, ... }:
{
  imports = [ 
    (inputs.den.namespace "dev" true) 
    (inputs.den.namespace "personal" true)
    (inputs.den.namespace "linux" true)
    (inputs.den.namespace "macos" true)
  ];

  _module.args.__findFile = den.lib.__findFile;
}

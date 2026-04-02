{ inputs, den, ... }:
{
  imports = [ 
    (inputs.den.namespace "dev" true) 
    (inputs.den.namespace "personal" true)
  ];

  _module.args.__findFile = den.lib.__findFile;
}

{ localPkgs ? import <nixpkgs> { system = "x86_64-linux"; }
, imagePkgs ? import <nixpkgs> { system = "x86_64-linux"; }
, ihpApp ? import ./app.nix { 
    additionalNixpkgsOptions = { system = "x86_64-linux"; }; 
    optimized = true; 
  }
}:

localPkgs.dockerTools.buildLayeredImage {
  name = "app";
  contents = [ imagePkgs.cacert ];
  config = {
    Cmd = [ "${ihpApp}/bin/RunProdServer" ];
    WorkingDir = "${ihpApp}/lib";
    ExposedPorts = {
      "8000" = {};
    };
  };
  maxLayers = 120;
}
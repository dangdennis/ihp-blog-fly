{ additionalNixpkgsOptions ? {}, optimized ? false }:

let
    ihp = builtins.fetchTarball {
        url = "https://ihp.digitallyinduced.com/BuildTarball?userId=ae472519-c897-439a-a394-bead33cc5065&token=HxXtQbyRSeKGWEBrcwBNFAxyYRPRfKul&version=c1a83966083cc429f0d218bd3a43d539053af8d9";
        sha256 = "06i6j6k1dbxl3329r1mz2bvrji16a9bazj3m8c82kg4c09q20ik4";
    };
    haskellEnv = import "${ihp}/NixSupport/default.nix" {
        ihp = ihp;
        haskellDeps = p: with p; [
            cabal-install
            base
            wai
            text
            hlint
            p.ihp
        ];
        otherDeps = p: with p; [
            # Native dependencies, e.g. imagemagick
        ];
        additionalNixpkgsOptions = additionalNixpkgsOptions; 
        projectPath = ./.;
        optimized = optimized;
    };
in
    haskellEnv




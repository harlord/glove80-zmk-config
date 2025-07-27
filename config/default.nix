{ pkgs ?  import <nixpkgs> {}
, firmware ? import ../src {}
}:

let
  config = ./.;

  # path to the combos-lead module checked out by the workflow
  combosLead = "${config}/modules/combos-lead";

  glove80_left = firmware.zmk.override {
    board = "glove80_lh";
    keymap = "${config}/glove80.keymap";
    kconfig = "${config}/glove80.conf";
    extraModules = [ combosLead ];
  };

  glove80_right = firmware.zmk.override {
    board = "glove80_rh";
    keymap = "${config}/glove80.keymap";
    kconfig = "${config}/glove80.conf";
    extraModules = [ combosLead ];
  };

in firmware.combine_uf2 glove80_left glove80_right

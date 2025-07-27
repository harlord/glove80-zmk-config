{ pkgs ?  import <nixpkgs> {}
, firmware ? import ../src {}
}:

let
  config = ./.;

  # path to the combos-lead module checked out by the workflow
  glove80_left = firmware.zmk.override {
    board = "glove80_lh";
    keymap = "${config}/glove80.keymap";
    kconfig = "${config}/glove80.conf";
  };

  glove80_right = firmware.zmk.override {
    board = "glove80_rh";
    keymap = "${config}/glove80.keymap";
    kconfig = "${config}/glove80.conf";
  };

in firmware.combine_uf2 glove80_left glove80_right

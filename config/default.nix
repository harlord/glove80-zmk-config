{ pkgs ?  import <nixpkgs> {}
, firmware ? import ../src {}
}:

let
  config = ./.
  ;
  extraModules = [ "${config}/modules/combos-lead" ];

  glove80_left  = firmware.zmk.override { board = "glove80_lh"; keymap = "${config}/glove80.keymap"; kconfig = "${config}/glove80.conf"; modules = extraModules; };
  glove80_right = firmware.zmk.override { board = "glove80_rh"; keymap = "${config}/glove80.keymap"; kconfig = "${config}/glove80.conf"; modules = extraModules; };

in firmware.combine_uf2 glove80_left glove80_right

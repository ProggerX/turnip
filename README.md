# turnip
### Lightweight and simple NixVim configuration
## Installation
turnip is just NixOS module, so add it to your system flake inputs and import:
```nix
{
    inputs.turnip = {
        url = "github:ProggerX/turnip";
        # inputs.nixpkgs.follows = "nixpkgs";
    };
    outputs = { ... }@inputs: {
        nixosConfigurations.<your-system> = {
            system = "<your-arch>";
            modules = [
                inputs.turnip.nixosModules.turnip
                {
                    turnip = {
                        enable = true;
                    };
                }
            ];
        };
    };
}
```
## Configuration
Turnip has some options:
- ```turnip.vimAlias``` - you know what it is, default: ```true```
- ```turnip.custom``` - basically the same as ```programs.nixvim```, default: ```{}```
- ```turnip.colorscheme``` - colorscheme, default: ```"base16"```
- ```turnip.options.wrap``` and ```turnip.options.relativenumber``` - wrap and relativenumer, of course, default: ```false, true```
- ```turnip.lsp_servers``` - lsp servers, default is rust-analyzer, gopls, nixd, pyright and clangd to configure, please, read [this](https://nix-community.github.io/nixvim/plugins/lsp/index.html)

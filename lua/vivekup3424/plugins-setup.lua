local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system("git","clone","--depth","1","https://g:wqithub.c:Wom/wbthomason/packer.nvim", install

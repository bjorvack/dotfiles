-- DAP (Debug Adapter Protocol) configuration for LazyVim
return {
    "mfussenegger/nvim-dap",           -- DAP core plugin
    dependencies = {
        "rcarriga/nvim-dap-ui",        -- DAP UI for better debugging experience
        "jay-babu/mason-nvim-dap.nvim", -- Install DAP servers via Mason
        "theHamsta/nvim-dap-virtual-text", -- Show virtual text for debug information
        "nvim-neotest/nvim-nio",       -- Neotest dependency
    },
    opts = function()
        local dap = require("dap")
        local path = require("mason-registry").get_package("php-debug-adapter"):get_install_path()
        dap.adapters.php = {
            type = "executable",
            command = "node",
            args = { path .. "/extension/out/phpDebug.js" },
        }
        dap.configurations.php = {
            {
                type = "php",
                request = "launch",
                name = "Listen for Xdebug",
                port = 9003,
                pathMappings = {
                    ["/var/www"] = "/Users/bjornvanacker/TeamBlue/Sites/shaas-api", -- Replace with your host project path
                },
            },
        }

        require("mason-nvim-dap").setup({
            ensure_installed = { "php" }, -- Automatically install PHP DAP server
        })
    end,
}

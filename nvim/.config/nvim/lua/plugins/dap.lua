-- DAP (Debug Adapter Protocol) configuration for LazyVim
return {
    "mfussenegger/nvim-dap",               -- DAP core plugin
    dependencies = {
        "rcarriga/nvim-dap-ui",            -- DAP UI for better debugging experience
        "jay-babu/mason-nvim-dap.nvim",    -- Install DAP servers via Mason
        "theHamsta/nvim-dap-virtual-text", -- Show virtual text for debug information
        "nvim-neotest/nvim-nio",           -- Neotest dependency
    },
    opts = function()
        local dap = require("dap")
        local path = require("mason-registry").get_package("php-debug-adapter"):get_install_path()
        local function find_project_root()
            local cwd = vim.fn.getcwd()
            local root_files = { "docker-compose.yaml", "Dockerfile" }

            while cwd ~= "/" do
                for _, file in ipairs(root_files) do
                    if vim.fn.filereadable(cwd .. "/" .. file) == 1 then
                        return cwd
                    end
                end
                cwd = vim.fn.fnamemodify(cwd, ":h")
            end

            return nil
        end

        local project_root = find_project_root()

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
                    ["/var/www"] = project_root or vim.fn.getcwd(), -- Replace with your host project path
                },
            },
        }

        require("mason-nvim-dap").setup({
            ensure_installed = { "php" }, -- Automatically install PHP DAP server
        })
    end,
}

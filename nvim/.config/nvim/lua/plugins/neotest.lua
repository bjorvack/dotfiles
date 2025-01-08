return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "tovijaeschke/neotest-phpunit", -- PHPUnit adapter
        },
        config = function()
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

            require("neotest").setup({
                adapters = {
                    require("neotest-phpunit")({
                        root_files = { "README.md", "phpunit.xml", "phpunit.xml.dist", ".gitignore" },
                        filter_dirs = { "vendor" },

                        phpunit_cmd = function()
                            local cwd = vim.fn.getcwd()
                            local test_file = vim.fn.expand("%")
                            if project_root and cwd == project_root then
                                -- Use the 'application' container for this project
                                if test_file ~= "" then
                                    return { "docker-compose", "exec", "application", "vendor/bin/phpunit", test_file }
                                else
                                    return { "docker-compose", "exec", "application", "vendor/bin/phpunit" }
                                end
                            else
                                -- Fallback for other projects
                                if test_file ~= "" then
                                    return { "phpunit", test_file }
                                else
                                    return "phpunit"
                                end
                            end
                        end
                    }),
                },
            })
        end,
    },
}

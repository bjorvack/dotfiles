return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required dependency
      "olimorris/neotest-phpunit", -- PHPUnit adapter
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-phpunit")({
             root_files = { "README.md", "phpunit.xml", "phpunit.xml.dist", ".gitignore" },
             filter_dirs = { "vendor" }
          }),
        },
      })
    end
  },
}
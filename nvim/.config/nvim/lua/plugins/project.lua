return {
    "ahmedkhalf/project.nvim",
    config = function() 
        require("project_nvim").setup({
            patterns = { 
                ".git",
                "package.json",
                "go.mod",
                "Makefile",
                "build.zig",
                "lazy-lock.json",
            },
        })
    end,
}


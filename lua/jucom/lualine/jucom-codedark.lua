-- -- Copyright (c) 2020-2021 Mofiqul Islam
-- -- MIT license, see LICENSE for more details.
-- local config = require('vscode.config')
-- local vscode = {}
-- local colors = {}

-- if vim.o.background == 'dark' then
--     colors.inactive = '#666666'
--     colors.bg = '#262626'
--     colors.bg2 = '#373737'
--     colors.fg = '#ffffff'
--     colors.red = '#f44747'
--     colors.green = '#4EC9B0'
--     colors.blue = '#0a7aca'
--     colors.lightblue = '#5CB6F8'
--     colors.yellow = '#ffaf00'
--     colors.pink = '#DDB6F2'
-- else
--     colors.inactive = '#888888'
--     colors.bg = '#F5F5F5'
--     colors.bg2 = '#E4E4E4'
--     colors.fg = '#343434'
--     colors.red = '#FF0000'
--     colors.green = '#008000'
--     colors.blue = '#AF00DB'
--     colors.lightblue = '#0451A5'
--     colors.yellow = '#ffaf00'
--     colors.pink = '#FFA3A3'
-- end

-- vscode.normal = {
--     a = { fg = vim.o.background == 'dark' and colors.fg or colors.bg, bg = colors.blue, gui = 'bold' },
--     b = { fg = colors.blue, bg = config.opts.transparent and 'NONE' or colors.bg2 },
--     c = { fg = colors.fg, bg = config.opts.transparent and 'NONE' or colors.bg },
-- }

-- vscode.visual = {
--     a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' },
--     b = { fg = colors.yellow, bg = config.opts.transparent and 'NONE' or colors.bg },
-- }

-- vscode.inactive = {
--     a = { fg = colors.fg, bg = colors.bg, gui = 'bold' },
--     b = { fg = colors.inactive, bg = config.opts.transparent and 'NONE' or colors.bg },
--     c = { fg = colors.inactive, bg = config.opts.transparent and 'NONE' or colors.bg },
-- }

-- vscode.replace = {
--     a = { fg = vim.o.background == 'dark' and colors.bg or colors.fg, bg = colors.red, gui = 'bold' },
--     b = { fg = colors.red, bg = config.opts.transparent and 'NONE' or colors.bg2 },
--     c = { fg = colors.fg, bg = config.opts.transparent and 'NONE' or colors.bg },
-- }

-- vscode.insert = {
--     a = { fg = vim.o.background == 'dark' and colors.bg or colors.fg, bg = colors.green, gui = 'bold' },
--     b = { fg = colors.green, bg = config.opts.transparent and 'NONE' or colors.bg2 },
--     c = { fg = colors.fg, bg = config.opts.transparent and 'NONE' or colors.bg },
-- }

-- vscode.terminal = {
--     a = { fg = vim.o.background == 'dark' and colors.bg or colors.fg, bg = colors.green, gui = 'bold' },
--     b = { fg = colors.fg, bg = config.opts.transparent and 'NONE' or colors.bg2 },
--     c = { fg = colors.fg, bg = config.opts.transparent and 'NONE' or colors.bg },
-- }

-- vscode.command = {
--     a = { fg = vim.o.background == 'dark' and colors.bg or colors.fg, bg = colors.pink, gui = 'bold' },
--     b = { fg = colors.pink, bg = config.opts.transparent and 'NONE' or colors.bg2 },
--     c = { fg = colors.fg, bg = config.opts.transparent and 'NONE' or colors.bg },
-- }

-- return vscode


-- Copyright (c) 2020-2021 Shatur95
-- MIT license, see LICENSE for more details.
-- stylua: ignore
local colors = {
    gray     = '#3C3C3C', -- ok
    red      = '#D83D2C', -- ok
    blue     = '#0078D4', -- ok
    pink     = '#705697',
    black    = '#262626', -- ok
    white    = '#D4D4D4', -- ok
    green    = '#16825D', -- ok
}

return {
    normal = {
        b = { fg = colors.green, bg = colors.black },
        a = { fg = colors.white, bg = colors.green, gui = 'bold' },
        c = { fg = colors.white, bg = colors.black },
    },
    command = {
        b = { fg = colors.pink, bg = colors.black },
        a = { fg = colors.white, bg = colors.pink, gui = 'bold' },
        c = { fg = colors.white, bg = colors.black },
    },
    visual = {
        b = { fg = colors.pink, bg = colors.black },
        a = { fg = colors.black, bg = colors.pink, gui = 'bold' },
    },
    inactive = {
        b = { fg = colors.black, bg = colors.blue },
        a = { fg = colors.white, bg = colors.gray, gui = 'bold' },
    },
    replace = {
        b = { fg = colors.red, bg = colors.black },
        a = { fg = colors.white, bg = colors.red, gui = 'bold' },
        c = { fg = colors.white, bg = colors.black },
    },
    insert = {
        b = { fg = colors.blue, bg = colors.black },
        a = { fg = colors.white, bg = colors.blue, gui = 'bold' },
        c = { fg = colors.white, bg = colors.black },
    },
}

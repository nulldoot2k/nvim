return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function() vim.fn["mkdp#util#install"]() end,
  vim.keymap.set("n", "[p", ":MarkdownPreview<CR>", {}),
  vim.keymap.set("n", "[s", ":MarkdownPreviewStop<CR>", {}),
}

require('telescope').setup {
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
    },
    git_files = {
      shorten_path = true
    }
  }
}
require('telescope').load_extension('fzy_native')


local M = {}

function M.setup()
  local builtin = require('statuscol.builtin')
  local sign_name = { 'todo%-sign%-' }
  require('statuscol').setup {
    bt_ignore = { 'terminal', 'nofile' },
    relculright = true,
    segments = {
      {
        sign = {
          name = sign_name,
          namespace = { 'diagnostic/signs' },
          maxwidth = 1,
          auto = 1,
        },
      },
      { text = { builtin.lnumfunc, ' ' } },
      { sign = { namespace = { 'gitsign' }, maxwidth = 1, colwidth = 1, auto = true } },
      { text = { builtin.foldfunc, ' ' } },
    },
  }
end

return M

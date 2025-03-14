local M = {}

function M.setup()
  require('neogit').setup {
    graph_style = 'unicode',
    use_default_keymaps = false,
    mappings = {
      commit_editor = {
        ['q'] = 'Close',
        ['<c-c><c-c>'] = 'Submit',
        ['<c-c><c-k>'] = 'Abort',
      },
      commit_editor_I = {
        ['<c-c><c-c>'] = 'Submit',
        ['<c-c><c-k>'] = 'Abort',
      },
      rebase_editor = {
        ['p'] = 'Pick',
        ['ç'] = 'Reword',
        ['e'] = 'Edit',
        ['s'] = 'Squash',
        ['f'] = 'Fixup',
        ['x'] = 'Execute',
        ['d'] = 'Drop',
        ['b'] = 'Break',
        ['q'] = 'Close',
        ['<cr>'] = 'OpenCommit',
        ['gs'] = 'MoveUp',
        ['gr'] = 'MoveDown',
        ['<c-c><c-c>'] = 'Submit',
        ['<c-c><c-k>'] = 'Abort',
        ['[c'] = 'OpenOrScrollUp',
        [']c'] = 'OpenOrScrollDown',
      },
      rebase_editor_I = {
        ['<c-c><c-c>'] = 'Submit',
        ['<c-c><c-k>'] = 'Abort',
      },
      finder = {
        ['<cr>'] = 'Select',
        ['<c-c>'] = 'Close',
        ['<esc>'] = 'Close',
        ['<c-s>'] = 'Next',
        ['<c-r>'] = 'Previous',
        ['<down>'] = 'Next',
        ['<up>'] = 'Previous',
        ['<tab>'] = 'MultiselectToggleNext',
        ['<s-tab>'] = 'MultiselectTogglePrevious',
        ['<c-j>'] = 'NOP',
      },
      -- Setting any of these to `false` will disable the mapping.
      popup = {
        ['?'] = 'HelpPopup',
        ['A'] = 'CherryPickPopup',
        ['D'] = 'DiffPopup',
        ['M'] = 'RemotePopup',
        ['P'] = 'PushPopup',
        ['X'] = 'ResetPopup',
        ['Z'] = 'StashPopup',
        ['b'] = 'BranchPopup',
        ['B'] = 'BisectPopup',
        ['c'] = 'CommitPopup',
        ['f'] = 'FetchPopup',
        ['l'] = 'LogPopup',
        ['m'] = 'MergePopup',
        ['p'] = 'PullPopup',
        ['ç'] = 'RebasePopup',
        ['v'] = 'RevertPopup',
        ['w'] = 'WorktreePopup',
      },
      status = {
        ['r'] = 'MoveUp',
        ['s'] = 'MoveDown',
        ['q'] = 'Close',
        ['o'] = 'OpenTree',
        ['I'] = 'InitRepo',
        ['1'] = 'Depth1',
        ['2'] = 'Depth2',
        ['3'] = 'Depth3',
        ['4'] = 'Depth4',
        ['<tab>'] = 'Toggle',
        ['x'] = 'Discard',
        ['é'] = 'Stage',
        ['É'] = 'StageUnstaged',
        ['<c-s>'] = 'StageAll',
        ['K'] = 'Untrack',
        ['u'] = 'Unstage',
        ['U'] = 'UnstageStaged',
        ['$'] = 'CommandHistory',
        ['Y'] = 'YankSelected',
        ['<c-r>'] = 'RefreshBuffer',
        ['<enter>'] = 'GoToFile',
        ['<c-v>'] = 'VSplitOpen',
        ['<c-x>'] = 'SplitOpen',
        ['<c-t>'] = 'TabOpen',
        ['{'] = 'GoToPreviousHunkHeader',
        ['}'] = 'GoToNextHunkHeader',
        ['[c'] = 'OpenOrScrollUp',
        [']c'] = 'OpenOrScrollDown',
      },
    },
  }
end

return M

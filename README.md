# check-folder-updated

You can trigger job steps on changes of folders or certain files in you project. It takes diff with the previous commit.

# Usage

See [action.yml](action.yml)

```yaml
name:_Your-Workflow
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
      with:
        # ! It is important option beacuse the action will take diff between HEAD and HEAD^
        fetch-depth: 2

    - name: Check updates
      id: check_folder
      uses: ./.github/actions/check-diff/
      with:
        folder: path/folder[/file]

    - name: Your target step
      if: steps.check_folder.outputs.has_changes == 'Yes'
      run: echo "Hello world!" 
```


# License

The scripts and documentation in this project are released under the [MIT License](LICENSE)
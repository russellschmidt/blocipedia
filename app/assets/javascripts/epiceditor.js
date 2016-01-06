var opts = {
  container: 'epiceditor',
  textarea: 'my-edit-area',
  basePath: 'epiceditor',
  clientSideStorage: true,
  localStorageName: 'epiceditor',
  useNativeFullscreen: true,
  parser: marked,
  file: {
    name: 'epiceditor',
    defaultContent: '',
    autoSave: 100
  },
  theme: {
    base: '<%= asset_path("base/epiceditor.css") %>',
    preview: '<%= asset_path("preview/github.css") %>',
    editor: '<%= asset_path("editor/epic-light.css") %>'
  },
  button: {
    preview: true,
    fullscreen: true,
    bar: "auto"
  },
  focusOnLoad: false,
  shortcut: {
    modifier: 18,
    fullscreen: 70,
    preview: 80
  },
  string: {
    togglePreview: 'Toggle Preview Mode',
    toggleEdit: 'Toggle Edit Mode',
    toggleFullscreen: 'Enter Fullscreen'
  },
  autogrow: false
}
var editor = new EpicEditor(opts).load();

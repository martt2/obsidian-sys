---
database-plugin: basic
---

```yaml:dbfolder
name: new database
description: new description
columns:
  __file__:
    key: __file__
    id: __file__
    input: markdown
    label: File
    accessorKey: __file__
    isMetadata: true
    skipPersist: false
    isDragDisabled: false
    csvCandidate: true
    isHidden: true
    position: 5
    sortIndex: -1
    width: 326
    config:
      enable_media_view: true
      link_alias_enabled: true
      media_width: 100
      media_height: 100
      isInline: true
      task_hide_completed: true
      footer_type: none
      persist_changes: false
      wrap_content: true
  tag:
    input: tags
    accessorKey: tag
    key: tag
    id: tag
    label: tag
    position: 4
    skipPersist: false
    isHidden: false
    sortIndex: -1
    width: 436
    options:
      - { label: "test", value: "test", color: "hsl(356, 95%, 90%)"}
      - { label: "aaa", value: "aaa", color: "hsl(135, 95%, 90%)"}
      - { label: "bbb", value: "bbb", color: "hsl(52, 95%, 90%)"}
      - { label: "ccc", value: "ccc", color: "hsl(142, 95%, 90%)"}
      - { label: "movie", value: "movie", color: "hsl(101, 95%, 90%)"}
      - { label: "music", value: "music", color: "hsl(8, 95%, 90%)"}
      - { label: "midia", value: "midia", color: "hsl(14, 95%, 90%)"}
      - { label: "ti", value: "ti", color: "hsl(27, 95%, 90%)"}
      - { label: "linux", value: "linux", color: "hsl(347, 95%, 90%)"}
      - { label: "hacker", value: "hacker", color: "hsl(24, 95%, 90%)"}
      - { label: "- ti - linux - hacker", value: "- ti - linux - hacker", color: "hsl(189, 95%, 90%)"}
      - { label: "coisa", value: "coisa", color: "hsl(79, 95%, 90%)"}
      - { label: "books", value: "books", color: "hsl(2, 95%, 90%)"}
      - { label: "pdf", value: "pdf", color: "hsl(6, 95%, 90%)"}
      - { label: "ebooks", value: "ebooks", color: "hsl(66, 95%, 90%)"}
    config:
      enable_media_view: true
      link_alias_enabled: true
      media_width: 100
      media_height: 100
      isInline: false
      task_hide_completed: true
      footer_type: none
      persist_changes: false
  name:
    input: text
    accessorKey: name
    key: name
    id: name
    label: name
    position: 3
    skipPersist: false
    isHidden: false
    sortIndex: -1
    width: 318
    config:
      enable_media_view: true
      link_alias_enabled: true
      media_width: 100
      media_height: 100
      isInline: false
      task_hide_completed: true
      footer_type: none
      persist_changes: false
  user:
    input: select
    accessorKey: user
    key: user
    id: user
    label: user
    position: 2
    skipPersist: false
    isHidden: false
    sortIndex: -1
    width: 154
    options:
      - { label: "user", value: "user", color: "hsl(0, 95%, 90%)"}
      - { label: "user1", value: "user1", color: "hsl(162, 95%, 90%)"}
      - { label: "add-storage", value: "add-storage", color: "hsl(24, 95%, 90%)"}
    config:
      enable_media_view: true
      link_alias_enabled: true
      media_width: 100
      media_height: 100
      isInline: false
      task_hide_completed: true
      footer_type: none
      persist_changes: false
  __modified__:
    key: __modified__
    id: __modified__
    input: metadata_time
    label: Modified
    accessorKey: __modified__
    isMetadata: true
    isDragDisabled: false
    skipPersist: false
    csvCandidate: true
    position: 1
    isHidden: false
    sortIndex: -1
    width: 210
    config:
      enable_media_view: true
      link_alias_enabled: true
      media_width: 100
      media_height: 100
      isInline: false
      task_hide_completed: true
      footer_type: none
      persist_changes: false
  note:
    input: text
    accessorKey: note
    key: note
    id: btn
    label: note
    position: 6
    skipPersist: false
    isHidden: false
    sortIndex: -1
    config:
      enable_media_view: true
      link_alias_enabled: true
      media_width: 100
      media_height: 100
      isInline: false
      task_hide_completed: true
      footer_type: none
      persist_changes: false
config:
  remove_field_when_delete_column: false
  cell_size: normal
  sticky_first_column: false
  group_folder_column: 
  remove_empty_folders: false
  automatically_group_files: false
  hoist_files_with_empty_attributes: true
  show_metadata_created: false
  show_metadata_modified: true
  show_metadata_tasks: false
  show_metadata_inlinks: false
  show_metadata_outlinks: false
  show_metadata_tags: false
  source_data: current_folder
  source_form_result: 
  source_destination_path: /
  row_templates_folder: /
  current_row_template: 
  pagination_size: 25
  font_size: 16
  enable_js_formulas: false
  formula_folder_path: /
  inline_default: false
  inline_new_position: last_field
  date_format: yyyy-MM-dd
  datetime_format: "yyyy-MM-dd HH:mm:ss"
  metadata_date_format: "yyyy-MM-dd HH:mm:ss"
  enable_footer: false
  implementation: default
filters:
  enabled: false
  conditions:
```
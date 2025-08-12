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
    position: 6
    sortIndex: -1
    width: 400
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
    position: 5
    skipPersist: false
    isHidden: false
    sortIndex: -1
    width: 400
    options:
      - { label: "test", value: "test", color: "hsl(197, 95%, 90%)"}
      - { label: "db", value: "db", color: "hsl(55, 95%, 90%)"}
      - { label: "aaa", value: "aaa", color: "hsl(36, 95%, 90%)"}
      - { label: "bbb", value: "bbb", color: "hsl(184, 95%, 90%)"}
      - { label: "ccc", value: "ccc", color: "hsl(120, 95%, 90%)"}
    config:
      enable_media_view: true
      link_alias_enabled: true
      media_width: 100
      media_height: 100
      isInline: false
      task_hide_completed: true
      footer_type: none
      persist_changes: false
      option_source: manual
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
    width: 400
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
    width: 150
    options:
      - { label: "test", value: "test", color: "hsl(157, 95%, 90%)"}
    config:
      enable_media_view: true
      link_alias_enabled: true
      media_width: 100
      media_height: 100
      isInline: false
      task_hide_completed: true
      footer_type: none
      persist_changes: false
      option_source: manual
  __modified__:
    key: __modified__
    id: __modified__
    input: metadata_time
    label: modified
    accessorKey: __modified__
    isMetadata: true
    isDragDisabled: false
    skipPersist: false
    csvCandidate: true
    position: 1
    isHidden: false
    sortIndex: 1
    width: 200
    isSorted: true
    isSortedDesc: true
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
    position: 7
    skipPersist: false
    isHidden: false
    sortIndex: -1
    width: 150
    config:
      enable_media_view: true
      link_alias_enabled: true
      media_width: 100
      media_height: 100
      isInline: false
      task_hide_completed: true
      footer_type: none
      persist_changes: false
  archived:
    input: checkbox
    accessorKey: archived
    key: archived
    id: archived
    label: archived
    position: 9
    skipPersist: false
    isHidden: false
    sortIndex: -1
    width: 50
    config:
      enable_media_view: true
      link_alias_enabled: true
      media_width: 100
      media_height: 100
      isInline: false
      task_hide_completed: true
      footer_type: none
      persist_changes: false
  rule:
    input: select
    accessorKey: rule
    key: rule
    id: rule
    label: rule
    position: 4
    skipPersist: false
    isHidden: false
    sortIndex: -1
    width: 100
    options:
      - { label: "project", value: "project", color: "hsl(0,80%,80%)"}
      - { label: "source", value: "source", color: "hsl(93,80%,80%)"}
      - { label: "study", value: "study", color: "hsl(210,80%,80%)"}
    config:
      enable_media_view: true
      link_alias_enabled: true
      media_width: 100
      media_height: 100
      isInline: false
      task_hide_completed: true
      footer_type: none
      persist_changes: false
      option_source: manual
  type:
    input: select
    accessorKey: type
    key: type
    id: type
    label: type
    position: 8
    skipPersist: false
    isHidden: false
    sortIndex: -1
    width: 150
    options:
      - { label: "database", value: "database", color: "hsl(30,80%,80%)"}
      - { label: "item", value: "item", color: "hsl(225,80%,80%)"}
    config:
      enable_media_view: true
      link_alias_enabled: true
      media_width: 100
      media_height: 100
      isInline: false
      task_hide_completed: true
      footer_type: none
      persist_changes: false
      option_source: manual
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
  pagination_size: 30
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
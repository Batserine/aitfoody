CKEDITOR.editorConfig = function (config) {
    // ... other configuration ...

    config.toolbar_mini = [
        {
            name: 'paragraph',
            groups: ['list', 'indent', 'blocks', 'align', 'bidi'],
            items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock']
        },
        {name: 'styles', items: ['Font', 'FontSize']},
        {name: 'colors', items: ['TextColor', 'BGColor']},
        {
            name: 'basicstyles',
            groups: ['basicstyles', 'cleanup'],
            items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat']
        },
        {name: 'insert', items: [ 'Table', 'HorizontalRule', 'SpecialChar']}
    ];
}
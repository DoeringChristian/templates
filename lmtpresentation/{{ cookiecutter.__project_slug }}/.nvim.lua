UpdateLspSettings("texlab", function(settings)
    settings.texlab.build = {
        executable = "make",
        args = {
            "pdf"
        },
        onSave = true
    }
end)

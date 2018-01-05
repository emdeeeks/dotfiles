local apps = {
    "redshift",
    "dropbox",
    "xrandr-setup"
}

for k,app in pairs(apps) do
    run_once(app)
end

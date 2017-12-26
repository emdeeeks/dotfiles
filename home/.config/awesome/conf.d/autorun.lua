local apps = {
    "redshift",
    "dropbox",
}

for k,app in pairs(apps) do
    run_once(app)
end
